//
//  BaseRouter.swift
//  Wind App Assessment
//
//  Created by MD RUBEL on 3/9/23.
//

import Foundation
import Alamofire

/// Network router to manage resource accesss depemdemcy
protocol BaseRouter: URLRequestConvertible {
    
    /// The base Path for same Router
    var baseURL: URL { get }
    
    /// The common Path for same Router
    var commonPathExtension: String { get }
    
    /// The HTTP method
    var method: HTTPMethod { get }
    
    /// The resource path
    var path: String { get }
    
    /// The query parameter associeted the Router.
    var queryStrings: [String: String]? { get }
    
    /// The body parameter associeted the Router.
    var parameters: Parameters? { get }
    
    /// The full URL.
    var fullURL: URL? { get }
    
    /// The headers parameter associeted the Router.
    var headers: HTTPHeaders? { get }
    
    /// The encoding Parameter used for the Router.
    var encoder: ParameterEncoding? { get }
    
    /// The cachePolicy used for the Router.
    var cachePolicy: URLRequest.CachePolicy? { get }
}

extension BaseRouter {
    
    /// The URL request.
    var urlRequest:URLRequest?{
        guard var request = try? self.asURLRequest() else{
            return nil
        }
        return request
    }
    
    /// The full URL.
    var fullURL: URL? {
        
        guard var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: false) else {
            return nil
        }
        
        urlComponents.path = "\(commonPathExtension)\(path)"
        urlComponents.queryItems = queryStrings?.sorted(by: { $0.0 < $1.0 }).map { URLQueryItem(name: $0, value: $1) }
        
        guard let url = urlComponents.url else {
            return nil
        }
        
        if urlComponents.path.isEmpty && urlComponents.queryItems?.count ?? 0 == 0  {
            return baseURL
        }
        
        return url
    }
    
    /// Returns a URL request or throws if an `Error` was encountered.
    func asURLRequest() throws -> URLRequest {
        
        guard let fullURL = fullURL else {
            throw AFError.invalidURL(url: baseURL)
        }
        
        var urlRequest = URLRequest(url: fullURL)
        urlRequest.httpMethod = method.rawValue
        urlRequest.timeoutInterval = 30
        
        
        if let cachePolicy = self.cachePolicy{
            urlRequest.cachePolicy = cachePolicy
        }
        
        let doesMethodHasHTTPBody = (method != .get && method != .connect && method != .head && method != .options && method != .trace)
        
        guard doesMethodHasHTTPBody else {
            return urlRequest
        }
        
        guard let encoder = encoder else{
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            return urlRequest
        }
        
        urlRequest = try encoder.encode(urlRequest, with: parameters)
        return urlRequest
    }
    
    /// HTTP method {space} The resource path
    var endpoint: String {
        return "\(method.rawValue) \(path)"
    }
}

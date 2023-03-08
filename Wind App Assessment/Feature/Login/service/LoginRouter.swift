//
//  LoginRouter.swift
//  Wind App Assessment
//
//  Created by MD RUBEL on 3/9/23.
//

import Foundation
import Alamofire

enum LoginRouter {
    case login(username: String, pin: String)
}

extension LoginRouter: BaseRouter {
    
    var baseURL: URL {
        switch self {
        case .login:
            return URL(string: "https://wind-assessment-api.vercel.app/api/v1/login")!
        }
    }
    
    var commonPathExtension: String {
        switch self {
        case .login:
            return ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return ""
        }
    }
    
    var queryStrings: [String : String]? {
        switch self {
        case .login:
            return nil
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .login(let username, let pin):
            return ["user": username, "pin": pin]
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .login:
            return nil
        }
    }
    
    var encoder: ParameterEncoding? {
        return JSONEncoding.default
    }
    
    var cachePolicy: URLRequest.CachePolicy? {
        return nil
    }
}

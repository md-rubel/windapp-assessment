//
//  ApiService.swift
//  Wind App Assessment
//
//  Created by MD RUBEL on 3/9/23.
//

import Foundation
import Alamofire

protocol Fetchable {
    func fetch<T: Codable>(with router: BaseRouter, completion: @escaping ((T?) -> Void))
}

class ApiService: Fetchable {
    
    static let shared = ApiService()
    private init() { }
    
    func fetch<T>(with router: BaseRouter, completion: @escaping ((T?) -> Void)) where T : Decodable, T : Encodable {
        
        AF.request(router).responseData { response in
            switch response.result {
                
            case .success(let data):
                do {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    completion(model)
                    
                } catch {
                    completion(nil)
                }
                
            case .failure(let error):
                debugPrint(error)
                completion(nil)
            }
        }
    }
}

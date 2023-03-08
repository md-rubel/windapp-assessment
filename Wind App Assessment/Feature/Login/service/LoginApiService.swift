//
//  LoginApiService.swift
//  Wind App Assessment
//
//  Created by MD RUBEL on 3/9/23.
//

import Foundation

protocol LoginApiService {
    func login(username: String, pin: String, completion: @escaping ((LoginModel?) -> ()))
}

extension ApiService: LoginApiService {
    
    func login(username: String, pin: String, completion: @escaping ((LoginModel?) -> ())) {
        fetch(with: LoginRouter.login(username: username, pin: pin), completion: completion)
    }
}

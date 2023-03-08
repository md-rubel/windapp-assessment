//
//  LoginViewModel.swift
//  Wind App Assessment
//
//  Created by MD RUBEL on 3/9/23.
//

import Foundation

class LoginViewModel {
    
    let apiService = ApiService.shared
    
    var userData: Observable<LoginData?> = Observable(nil)
    
    func login(user: String, pin: String) {
        
        apiService.login(username: user, pin: pin) { [weak self] model in
            self?.userData.value = model?.data
        }
    }
}

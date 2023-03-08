//
//  LoginResource.swift
//  Wind App Assessment
//
//  Created by MD RUBEL on 3/8/23.
//

import Foundation

enum LoginResource: String {
    
    var string: String {
        // can be added localizations logic here
        return self.rawValue
    }
    
    case sendFund = "Send Fund"
    case usernameTitle = "@username or wallet address"
    case usernamePlaceholder = "john_doe"
    case pinTitle = "Enter your PIN"
    case continueButton = "Continue"
    case loginFailedTitle = "Login Failed"
    case loginFailedMessage = "Please try again with correct username and pin."
    
    static var scanImageName: String {
        return "scan"
    }
    
    static var closeImageName: String {
        return "close"
    }
}

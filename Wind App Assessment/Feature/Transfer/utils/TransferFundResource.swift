//
//  TransferFundResource.swift
//  Wind App Assessment
//
//  Created by MD RUBEL on 3/8/23.
//

import Foundation

enum TransferFundResource: String {
    
    var string: String {
        // can be added localizations logic here
        return self.rawValue
    }
    
    case sendFund = "Send Fund"
    case recipientTitle = "Recipient"
    case continueButton = "Continue"
    case max = "Max"
    case addFund = "Add fund"
    case insufficientBalance = "Insufficient balance"
    
    static var backImageName: String {
        return "arrow-left"
    }
}

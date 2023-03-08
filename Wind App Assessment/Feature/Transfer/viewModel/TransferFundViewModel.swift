//
//  TransferFundViewModel.swift
//  Wind App Assessment
//
//  Created by MD RUBEL on 3/8/23.
//

import UIKit

class TransferFundViewModel {
    
    private let username: String?
    private let walletAddress: String?
    private let balance: Double?
    private let profileImage: String?
    
    init(username: String?, wallet: String?, balance: Double?, image: String?) {
        self.username = username
        self.walletAddress = wallet
        self.balance = balance
        self.profileImage = image
    }
    
    var lowBalanceObservar: Observable<Bool> = Observable(false)
    
    var availableBalance: Double {
        return balance ?? 0
    }
    
    var recipientImageUrl: String? {
        return profileImage
    }
    
    var recipientAddress: NSAttributedString? {
        let font = Theme.Font.medium.withSize(16.dynamic)
        let username = "@\(self.username ?? "")"
        let wallet = " - \(self.walletAddress ?? "")"
        
        let userText = NSMutableAttributedString(
            string: username,
            attributes: [NSAttributedString.Key.foregroundColor: Theme.Color.primary,
                         NSAttributedString.Key.font: font]
        )
        
        let walletText = NSMutableAttributedString(
            string: wallet,
            attributes: [NSAttributedString.Key.foregroundColor: Theme.Color.labelSecondary,
                         NSAttributedString.Key.font: font]
        )
        
        userText.append(walletText)
        return userText
    }
}

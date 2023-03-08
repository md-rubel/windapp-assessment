//
//  TransferFundViewModel.swift
//  Wind App Assessment
//
//  Created by MD RUBEL on 3/8/23.
//

import UIKit

class TransferFundViewModel {
    
    var lowBalanceObservar: Observable<Bool> = Observable(false)
    
    var availableBalance: Double {
        return 35.345
    }
    
    var recipientImage: UIImage? {
        return UIImage(named: "")
    }
    
    var recipientAddress: NSAttributedString? {
        return NSMutableAttributedString(string: "Hello")
    }
}

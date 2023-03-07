//
//  Number+Extension.swift
//  Wind App Assessment
//
//  Created by MD RUBEL on 3/8/23.
//

import UIKit

fileprivate class Device {
    // Base width in point, use iPhone 6
    static let base: CGFloat = 375
    
    static var ratio: CGFloat {
        return UIScreen.main.bounds.width / base
    }
}

extension CGFloat {
    var dynamic: CGFloat {
        return self * Device.ratio
    }
}

extension Double {
    var dynamic: CGFloat {
        return CGFloat(self) * Device.ratio
    }
}

extension Int {
    var dynamic: CGFloat {
        return CGFloat(self) * Device.ratio
    }
}

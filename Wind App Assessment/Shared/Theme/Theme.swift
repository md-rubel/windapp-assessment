//
//  Theme.swift
//  Wind App Assessment
//
//  Created by MD RUBEL on 3/8/23.
//

import UIKit

class Theme {
    
    struct Color {
        static var primary: UIColor { return UIColor(hex: "#6E50FF") }
        static var secondary: UIColor { return primary.withAlphaComponent(0.5) }
        
        static var label: UIColor { return UIColor.black }
        static var labelSecondary: UIColor { return UIColor(hex: "#75808A") }
    }
    
    struct Font {
        static var regular: UIFont { return CircularStdFont.regular.getFont(size: 13)}
        static var bold: UIFont { return CircularStdFont.bold.getFont(size: 13)}
        static var medium: UIFont { return CircularStdFont.medium.getFont(size: 13)}
        
        static var regularItalic: UIFont { return CircularStdFont.regularItalic.getFont(size: 13)}
        static var boldItalic: UIFont { return CircularStdFont.boldItalic.getFont(size: 13)}
        static var mediumItalic: UIFont { return CircularStdFont.mediumItalic.getFont(size: 13)}
    }
}

enum CircularStdFont: String {
    
    case regular = "CircularStd-Book"
    case bold = "CircularStd-Bold"
    case medium = "CircularStd-Medium"
    
    case regularItalic = "CircularStd-BookItalic"
    case boldItalic = "CircularStd-BoldItalic"
    case mediumItalic = "CircularStd-MediumItalic"
    
    func getFont(size: CGFloat) -> UIFont {
        return getSafeFont(named: self.rawValue, size: size)
    }
    
    private func getSafeFont(named: String,size: CGFloat) -> UIFont {
        if let font = UIFont(name: named, size: size) {
            return font
        }
        return UIFont.systemFont(ofSize: size)
    }
}

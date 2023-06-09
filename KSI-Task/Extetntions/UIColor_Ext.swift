//
//  UIColor_Ext.swift
//  Leedo
//
//  Created by eslam dweeb on 21/09/2022.
//

import UIKit

extension UIColor {

    @nonobjc class var lavenderPurple: UIColor {
        return UIColor(named: "lavender purple")!
    }

    convenience init?(hex: String, alpha: CGFloat = 1.0) {
        var hexValue = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexValue.hasPrefix("#") {
            hexValue.remove(at: hexValue.startIndex)
        }
        guard hexValue.count == 6 else {
            return nil
        }
        var rgbValue: UInt64 = 0
        Scanner(string: hexValue).scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

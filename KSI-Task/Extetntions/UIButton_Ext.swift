//
//  UIButton_Ext.swift
//  EasySchools
//
//  Created by eslam dweeb on 21/05/2023.
//

import UIKit


extension UIButton {
    convenience init(title: String) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
    }
  
    func configureBtn(_ title:String,_ font:UIFont,_ textColor:UIColor,_ borderColor:UIColor? = nil,_ borderWidth:CGFloat? = nil,cornerRadius:CGFloat? = nil,_ backgroundColor:UIColor,_ image:UIImage? = nil,imagePlacement:NSDirectionalRectEdge? = nil){
        
        self.setAttributedTitle( NSAttributedString(string: title, attributes: [NSAttributedString.Key.font:  font,NSAttributedString.Key.foregroundColor : textColor]), for: .normal)
        self.backgroundColor = backgroundColor
       
        if let cornerRadius {
            self.cornerRadius = cornerRadius
        }
        if let image {
            self.setImage(image, for: .normal)
        }
        if let borderColor {
            self.borderColor = borderColor
        }
        if let borderWidth {
            self.borderWidth = borderWidth
        }
        if let imagePlacement {
           
            if #available(iOS 15.0, *) {
                self.configuration?.preferredSymbolConfigurationForImage = .init(scale: .medium)
                self.configuration?.imagePlacement = imagePlacement
                self.configuration?.imagePadding  = 8
            } else {
                // Fallback on earlier versions
                self.imageEdgeInsets = UIEdgeInsets(top: 0, left: self.bounds.width - (30 + 8), bottom: 0, right: 0) // adjust image trailling placement
                self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0) // adjust title placement
                self.imageView?.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
                self.imageView?.contentMode = .scaleAspectFit
            }
        }
//        if let titleAlignment {
//            self.configuration?.titleAlignment = titleAlignment
//        }
        
    }

}

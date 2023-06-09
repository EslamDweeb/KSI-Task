//
//  UITextField_ext.swift
//  Leedo
//
//  Created by eslam dweeb on 21/09/2022.
//

import UIKit
 
@IBDesignable extension UITextField {
    
    func setPlaceHolderColor(_ color:UIColor,_ font:UIFont? = nil){
        if let font {
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ?  self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color,.font: font])
        }else{
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ?  self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
        }
    }
    func setGradientBorder(colors: [CGColor], width: CGFloat) {
        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: .zero, size: self.frame.size)
        gradient.colors = colors
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        
        let shape = CAShapeLayer()
        shape.lineWidth = width
        shape.path = UIBezierPath(rect: self.bounds).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape
        
        self.layer.addSublayer(gradient)
    }
    func addBaseBorder(borderColor:UIColor,borderWidth:CGFloat,cornerRaduis:CGFloat){
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.cornerRadius = cornerRaduis
    }
}


extension UILabel {
    convenience init(text: String, font: UIFont, numberOfLines: Int = 1,textColor:UIColor? = nil,textAlign:NSTextAlignment = .left) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
        guard let color = textColor else{return}
        self.textColor = color
        self.textAlignment = textAlign
    }
    func configureLbl(text: String, font: UIFont, numberOfLines: Int = 1,textColor:UIColor? = nil,textAlign:NSTextAlignment = .left){
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
        guard let color = textColor else{return}
        self.textColor = color
        self.textAlignment = textAlign
    }
}

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], customSpacing: CGFloat = 0,axis:NSLayoutConstraint.Axis) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.spacing = customSpacing
        self.axis = axis
    }
}

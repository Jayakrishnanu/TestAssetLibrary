//
//  TestButton.swift
//  TestAssetLibrary
//
//  Created by Jayakrishnan u on 6/25/20.
//  Copyright © 2020 Jayakrishnan u. All rights reserved.
//

import UIKit

class TestButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        if let design = DesignDataManager().designDataAttributes() {
            backgroundColor = UIColor(named: "buttonColor")
            //backgroundColor = UIColor(hex: design.backgroundColor)
            titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(design.titleFontSize))
            setTitleColor(UIColor(hex: design.titleColor), for: .normal)
            translatesAutoresizingMaskIntoConstraints = false
            let widthContraints =  NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 200)
            let heightContraints = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
            NSLayoutConstraint.activate([heightContraints,widthContraints])
        }
        
    }
    
}

extension UIColor {
    public convenience init?(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}

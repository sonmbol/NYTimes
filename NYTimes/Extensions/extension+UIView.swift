//
//  extension+UIView.swift
//  app
//
//  Created by ahmed abdalla on 10/06/2022.
//

import UIKit
import DropDown

@IBDesignable extension UIView {
    
    
    @IBInspectable
    public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    
}



extension DropDown {
    func custompStyle(){
        backgroundColor = .white
        selectionBackgroundColor = UIColor(named: "AccentColor") ?? .green
        selectedTextColor = .white
        textColor = .black
        shadow_Radius = 0
        shadowColor = .clear
        shadowOpacity = 0
        corner_Radius = 10
        setShadow(Sview: self, value: 10)
    }
    //MARK: Shadow to List of Period
    func setShadow(Sview : UIView,value : CGFloat){
        Sview.layer.cornerRadius = value
        Sview.clipsToBounds = true
        Sview.layer.masksToBounds = false
        Sview.layer.shadowRadius = 0.5
        Sview.layer.shadowColor = UIColor.darkGray.cgColor
        let scale = UIScreen.main.scale
        Sview.layer.shadowOffset = CGSize(width: 0, height: 0.5)
        Sview.layer.shadowOpacity = 0.8
        Sview.layer.needsDisplayOnBoundsChange = true
        Sview.layer.contentsScale = scale
        Sview.layer.rasterizationScale = scale
        Sview.layer.shouldRasterize = true
    }
}

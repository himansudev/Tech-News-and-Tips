//
//  Extension.swift
//  Tech News and Tips
//
//  Created by kiran on 15/04/20.
//  Copyright © 2020 Kiran. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addCornerRadius(element: UIView, giveClipToBounds: Bool) {
        element.layer.cornerRadius = 25
        element.clipsToBounds = giveClipToBounds
    }
    
    func addColor(element: UIView){
        element.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.7254901961, blue: 0.3294117647, alpha: 1)
    }
    
    func addShadow(element: UIView, giveMaskToBounds: Bool) {
        element.layer.shadowColor = UIColor.black.cgColor
        element.layer.shadowOffset = CGSize(width: 0, height: 1)
        element.layer.shadowRadius = 2
        element.layer.shadowOpacity = 0.5
    }
}

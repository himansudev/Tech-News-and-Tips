//
//  Extension+UIAlert.swift
//  Tech News and Tips
//
//  Created by Himansu Sekhar Panigrahi on 20/04/20.
//  Copyright © 2020 hpApps. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    
    static func messageAlert(target:UIViewController,title:String,message:String) {
        let alertController = UIAlertController(title: title, message:message , preferredStyle: UIAlertController.Style.alert)
        
        let okAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        
        alertController.addAction(okAlertAction)
        
        target.present(alertController, animated: true, completion: nil)
    }
}

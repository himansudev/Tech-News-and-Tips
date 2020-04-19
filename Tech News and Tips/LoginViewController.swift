//
//  LoginViewController.swift
//  Tech News and Tips
//
//  Created by kiran on 15/04/20.
//  Copyright © 2020 Kiran. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    //MARK:- UIObjects
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var emailtextField: UITextField!
    @IBOutlet weak var passwordtextField: UITextField!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
   
    @IBOutlet weak var logInLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        initialSetup()
        
    }
}

//MARK:- For UI Configuration
extension LoginViewController {
    
    func initialSetup() {
        configureUI()
    }
    
    func configureUI() {
        
        view.backgroundColor = #colorLiteral(red: 0.1490196078, green: 0.4666666667, blue: 0.7450980392, alpha: 1)
        
        contentView.backgroundColor = #colorLiteral(red: 0.1490196078, green: 0.4666666667, blue: 0.7450980392, alpha: 1)
        
        //TextFields
        emailtextField.layer.cornerRadius = 10
        passwordtextField.layer.cornerRadius = 10
        
        emailtextField.clipsToBounds = true
        passwordtextField.clipsToBounds = true
        
        emailtextField.placeholder = Str.emailTFPlaceholder()
        passwordtextField.placeholder = Str.passwordTFPlaceholder()
        
        //Label
        logInLabel.textColor = UIColor.white
        
        //Buttons
        forgotPasswordButton.setTitle(Str.forgotPassWordButtonTitle(), for: UIControl.State.normal)
        loginButton!.setTitle(Str.logInButtonTitle(), for: UIControl.State.normal)
        cancelButton.setTitle(Str.cancelButtonTitle(), for: UIControl.State.normal)
        
        forgotPasswordButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        loginButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        cancelButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        
        loginButton.layer.cornerRadius = 10
        
        loginButton.backgroundColor = #colorLiteral(red: 0.4914135933, green: 0.7267015576, blue: 0.2322855592, alpha: 1)
        forgotPasswordButton?.backgroundColor = #colorLiteral(red: 0.1490196078, green: 0.4666666667, blue: 0.7450980392, alpha: 1)
        
        
        //Button Event Handlers
        loginButton.addTarget(self, action: #selector(loginButtonEH), for: UIControl.Event.touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonEH), for: UIControl.Event.touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelButtonEH), for: UIControl.Event.touchUpInside)
        
        
        
        
        
    }
    
}


//MARK:- Event Handlers
extension LoginViewController {
    
    @objc func loginButtonEH() {
        let dashBoardVC = self.storyboard?.instantiateViewController(identifier: Str.dashBoardVC()) as! DashboardViewController
        
        self.navigationController?.pushViewController(dashBoardVC, animated: true)
    }
    
    @objc func forgotPasswordButtonEH() {
        
    }
    
    @objc func cancelButtonEH() {
        self.navigationController?.popViewController(animated: true)
    }
    
   
}

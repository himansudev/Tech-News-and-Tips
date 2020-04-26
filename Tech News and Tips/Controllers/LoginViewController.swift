//
//  LoginViewController.swift
//  Tech News and Tips
//
//  Created by kiran on 15/04/20.
//  Copyright © 2020 Kiran. All rights reserved.
//

import UIKit
import FirebaseAuth

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
    
    @IBOutlet weak var warningLabel: UILabel!
    
    
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
        warningLabel.text = ""
        logInLabel.textColor = UIColor.white
        warningLabel.textColor = UIColor.red
        
        
        
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
        
        let message = checkTextFieldForDataPresence()
        
        warningLabel.text = message
        
        if !(message != "") {
            login()
        }
    }
    
    
    
    
    @objc func forgotPasswordButtonEH() {
        
    }
    
    @objc func cancelButtonEH() {
        self.navigationController?.popViewController(animated: true)
    }
    
   
}


//Supporting Functions
extension LoginViewController {
    
    //Login Function
    func login() {
        
        let loadingAnimation = HPLoadingAnimation()
        
        loadingAnimation.startAnimation(targetVC: self)
        
        let email = emailtextField.text!
        
        let pass = passwordtextField.text!
        
        Auth.auth().signIn(withEmail: email, password: pass) { (result, err) in
            
            
          if err != nil {



                loadingAnimation.stopAnimation()

                UIAlertController.messageAlert(target: self, title: "Invalid Credentials", message: "Invalid E-Mail\n Or\n Password")
            }
            else
          {
                
                let tabBarController = self.storyboard?.instantiateViewController(identifier: VC.tabBarController())

                loadingAnimation.stopAnimation()

                self.navigationController?.pushViewController(tabBarController!, animated: true)


            }
            
        }
    }
    
    //Checks If Textfields Are Empty Or Not
    func checkTextFieldForDataPresence() -> String {
        
        if(emailtextField.text == "" && passwordtextField.text == "") {
            return "【 Fields Cannot Be Empty 】"
        }
        else if(emailtextField.text != "" && passwordtextField.text == "") {
            return "【 Password Cannot Be Empty 】"
        }
        
        else if(emailtextField.text == "" && passwordtextField.text != "") {
            return "【 Email Cannot Be Empty 】"
        }
        
        return ""
        
    }
     
}


extension Str {
    static func forgotPassWordButtonTitle() -> String {return "Forgot Password?"}
    static func logInButtonTitle() -> String {return "LOG IN"}
    static func cancelButtonTitle() -> String {return "Cancel"}
    
    static func emailTFPlaceholder() -> String {return "E-Mail"}
    static func passwordTFPlaceholder() -> String {return "Password"}

}

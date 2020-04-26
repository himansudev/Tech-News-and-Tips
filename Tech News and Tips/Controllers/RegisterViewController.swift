//
//  RegisterViewController.swift
//  Tech News and Tips
//
//  Created by kiran on 15/04/20.
//  Copyright © 2020 Kiran. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var reTypePasswordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var faceBookButton: UIButton!
    
    @IBOutlet weak var googleButton: UIButton!
    
    let dataBaseRef = Firestore.firestore()
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        firstNameTextField.delegate = self
        reTypePasswordTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        signUpButton.addCornerRadius(element: signUpButton, giveClipToBounds: false)
        signUpButton.addShadow(element: signUpButton, giveMaskToBounds: false)
        
        faceBookButton.addCornerRadius(element: faceBookButton, giveClipToBounds: false)
            
        googleButton.addCornerRadius(element: googleButton, giveClipToBounds: false)
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        
        let validateAllFields = validateUserDetails()
        
        if (validateAllFields == true) {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result, err) in
                if (err != nil) {
                    print("Error in creating the user")
                }
                else{
                    
                    guard let firebaseResult = result else {
                        return
                    }
                    
                    self.dataBaseRef.collection("User Details").addDocument(data: ["name" : self.firstNameTextField.text, "email" : self.emailTextField.text, "userId" : firebaseResult.user.uid]) { (error) in
                        if(error != nil){
                            print("Error in adding user details")
                        }else {
                            print("User details added successfully")
                        }
                    }
                }
            }
        }
    }
    
    
    func validateUserDetails() -> Bool {
        
        guard let email = emailTextField.text else {return false}
        guard let name = firstNameTextField.text else {return false}
        guard let password = passwordTextField.text else {return false}
            
        if(email == "" || password == "" || name == "") {
            return false
        }
        else{
            return true
        }
    }
    
    
    
}


extension UIViewController: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.tintColor = #colorLiteral(red: 0, green: 0.7386979461, blue: 0.2693130076, alpha: 1)
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        textField.layer.borderColor = .none
    }
}

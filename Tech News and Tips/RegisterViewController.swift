//
//  RegisterViewController.swift
//  Tech News and Tips
//
//  Created by kiran on 15/04/20.
//  Copyright © 2020 Kiran. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var reTypePasswordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var faceBookButton: UIButton!
    
    @IBOutlet weak var googleButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    
    
    

}

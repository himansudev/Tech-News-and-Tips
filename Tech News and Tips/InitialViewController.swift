//
//  ViewController.swift
//  Tech News and Tips
//
//  Created by kiran on 14/04/20.
//  Copyright © 2020 Kiran. All rights reserved.
//

import UIKit
import Firebase

class InitialViewController: UIViewController {
 
    @IBOutlet weak var registerButtonOutlet: UIButton!
    
    @IBOutlet weak var loginButtonOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let registerVC = storyBoard.instantiateViewController(identifier: "register") as? RegisterViewController
            else {
                return  }
        navigationController?.pushViewController(registerVC, animated: true)
        print("hello")
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let registerVC = storyBoard.instantiateViewController(identifier: "login") as? LoginViewController
            else {
                return  }
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        registerButtonOutlet.addColor(element: registerButtonOutlet)
        loginButtonOutlet.addColor(element: loginButtonOutlet)
        
        registerButtonOutlet.addCornerRadius(element: registerButtonOutlet, giveClipToBounds: false)
        loginButtonOutlet.addCornerRadius(element: loginButtonOutlet, giveClipToBounds: false)
        
        registerButtonOutlet.addShadow(element: registerButtonOutlet, giveMaskToBounds: false)
        loginButtonOutlet.addShadow(element: loginButtonOutlet, giveMaskToBounds: false)
    }

}


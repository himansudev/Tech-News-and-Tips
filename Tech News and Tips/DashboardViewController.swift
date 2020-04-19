//
//  DashboardViewController.swift
//  Tech News and Tips
//
//  Created by Himansu Sekhar Panigrahi on 18/04/20.
//  Copyright © 2020 hpApps. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var logoutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        logoutButton.addTarget(self, action: #selector(logoutButtonEH), for: UIControl.Event.touchUpInside)
    }
    
    @objc func logoutButtonEH() {
        self.navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

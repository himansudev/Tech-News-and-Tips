//
//  HPLoadingAnimation.swift
//  loadingAnimation
//
//  Created by Himansu Sekhar Panigrahi on 20/04/20.
//  Copyright © 2020 hpApps. All rights reserved.
//

import UIKit


class HPLoadingAnimation:NSObject {
    
   
    private var animationVC:UIViewController!
    
    override init() {
        super.init()
    }
    
  
    
    
    public func startAnimation(targetVC:UIViewController) {
        let animationVC = AnimationViewController()
        self.animationVC = targetVC
        animationVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        targetVC.present(animationVC, animated: false, completion: nil)
    }
    
    public func stopAnimation() {
        animationVC.dismiss(animated: false, completion: nil)
    }
}




class AnimationViewController:UIViewController {
    
    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()
    
    let view1Height:CGFloat = 70
    let view2Height:CGFloat = 60
    let view3Height:CGFloat = 50
    
    let animationHeight:CGFloat = 80
    
    var view1HeightConstraint:NSLayoutConstraint!
    var view2HeightConstraint:NSLayoutConstraint!
    var view3HeightConstraint:NSLayoutConstraint!
    
    let viewCommonWidth:CGFloat = 20
    
    let stackViewSpacing:CGFloat = 10
    
    let stackView = UIStackView()
    
    var animationDuration:Double! = 0.3
    
    var timerCount = 0
    
    var defaultColor:UIColor = UIColor.lightGray
    
    var animatingColor:UIColor = UIColor.black
    
    override func viewDidLoad() {
        self.initialSetup()
    }
    
    func initialSetup() {
        
        self.view.addSubview(stackView)
        stackView.spacing = self.stackViewSpacing
        stackView.alignment = UIStackView.Alignment.center
        
        //Constraints On Stack View
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        stackView.addArrangedSubview(view1)
        stackView.addArrangedSubview(view2)
        stackView.addArrangedSubview(view3)
        
        
        var myView = view1
        myView.translatesAutoresizingMaskIntoConstraints = false
        view1HeightConstraint = myView.heightAnchor.constraint(equalToConstant: view1Height)
        view1HeightConstraint.isActive = true
        myView.widthAnchor.constraint(equalToConstant: viewCommonWidth).isActive = true
        
        
        myView = view2
        myView.translatesAutoresizingMaskIntoConstraints = false
        view2HeightConstraint = myView.heightAnchor.constraint(equalToConstant: view2Height)
        view2HeightConstraint.isActive = true
        myView.widthAnchor.constraint(equalToConstant: viewCommonWidth).isActive = true
        
        myView = view3
        myView.translatesAutoresizingMaskIntoConstraints = false
        view3HeightConstraint = myView.heightAnchor.constraint(equalToConstant: view3Height)
        view3HeightConstraint.isActive = true
        myView.widthAnchor.constraint(equalToConstant: viewCommonWidth).isActive = true
        
        
        
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(timerEH), userInfo: nil, repeats: true)
    }
    
    
    @objc func timerEH() {
        
         timerCount += 1

        switch timerCount {
            
        case 1:
            
            UIView.animate(withDuration: animationDuration, animations: {
                //Reset
                self.reset(view: self.view3)
                
                //Animate
                self.animate(view: self.view1)
                
                self.view.layoutIfNeeded()
            })
            
        case 2:
            
            UIView.animate(withDuration: animationDuration, animations: {
                //Reset
                self.reset(view: self.view1)
                
                //Animate
                self.animate(view: self.view2)
                self.view.layoutIfNeeded()
            })
            
            
            
        default:
            
            
            UIView.animate(withDuration: animationDuration, animations: {
                //Reset
                self.reset(view: self.view2)
                
                //Animate
                self.animate(view: self.view3)
                self.view.layoutIfNeeded()
            })
            
            
            
            timerCount = 0
        }

        
       
        
    }
    
    
    func reset(view forView:UIView) {
       
           
        forView.backgroundColor = self.defaultColor
        
        switch forView {
        case view1:
            self.view3HeightConstraint.constant = self.view3Height
        case view2:
            self.view1HeightConstraint.constant = self.view1Height
        default:
            self.view2HeightConstraint.constant = self.view2Height
        }
        
    }
    
    func animate(view forView:UIView) {
        
        forView.backgroundColor = .black
        
        switch forView {
        case view1:
            self.view3HeightConstraint.constant = self.animationHeight
        case view2:
            self.view1HeightConstraint.constant = self.animationHeight
        default:
            self.view2HeightConstraint.constant = self.animationHeight
        }
        
        
    }
    
}

//
//  ViewController.swift
//  audacityIt
//
//  Created by RASHED on 6/15/19.
//  Copyright © 2019 rashed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var signInBtn: UIButton!
    @IBOutlet var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        signInBtn.layer.cornerRadius = 5
        signUpBtn.layer.cornerRadius = 5
        
    }
    
    //MARK:Sign In page
    @IBAction func goToSignInPage(_ sender: Any) {
        //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //        let vc = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        //        self.navigationController?.pushViewController(vc, animated: true)
        //        print("all is well")
        //        let vc = storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        //    self.navigationController?.pushViewController(vc, animated: true)
    }
    //MARK:Sign Up page
    @IBAction func goToSignUpPage(_ sender: Any) {
        print("i am sign up")
    }
    
}


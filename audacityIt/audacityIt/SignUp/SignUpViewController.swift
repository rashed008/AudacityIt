//
//  SignUpViewController.swift
//  audacityIt
//
//  Created by RASHED on 6/15/19.
//  Copyright © 2019 rashed. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SignUpViewController: UIViewController {
    
    @IBOutlet var mobileNumber: UITextField!
    @IBOutlet var pinCode: UITextField!
    @IBOutlet var fullName: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var signUpBtn: UIButton!
    
    var siginUpView: [SignUpModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        signUpBtn.layer.cornerRadius = 5
    }
    //MARK: Send sign up data to server
    @IBAction func onTapSignUp(_ sender: Any) {
        sendSignUpDataToServer()
    }
    //MARK: Resend pin code
    @IBAction func OnTapResendCode(_ sender: Any) {
        sendSignUpDataToServer()
    }
    
    //MARK: Post Sign Up data
    private func sendSignUpDataToServer() {
        let urlString = "https://www.meenaclick.com/api/v2/registration-try"
        
        Alamofire.request(urlString, method: .post, parameters: ["mobile": mobileNumber.text!,"email": email.text!,"full_name": fullName.text!,"pin_code": pinCode.text!],encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success:
                print(response)
                if let result = response.result.value,  let JSON = result as? [String: Any] {
                    print(JSON["message"]as? String as Any)
                    let alert = UIAlertController(title: "Alert", message: JSON["message"]as? String, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
                    self.present(alert, animated: true)
                }
                
                break
            case .failure(let error):
                if let result = response.result.value,  let JSON = result as? [String: Any] {
                    print(JSON["message"]as? String as Any)
                    let alert = UIAlertController(title: "Alert", message: JSON["message"]as? String, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
                    self.present(alert, animated: true)
                }
                print("Error :  - \(error)")
            }
        }
    }
}

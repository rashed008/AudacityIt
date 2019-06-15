//
//  SignInViewController.swift
//  audacityIt
//
//  Created by RASHED on 6/15/19.
//  Copyright © 2019 rashed. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SignInViewController: UIViewController {
    
    @IBOutlet var mobileNumber: UITextField!
    @IBOutlet var pinCodeNumber: UITextField!
    @IBOutlet var verifyBtn: UIButton!
    
    var siginInView: [SignInModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        verifyBtn.layer.cornerRadius = 5
    }
    
    //MARK: Send sign in data to server
    @IBAction func onTapGetPinCode(_ sender: Any) {
        sendSignInDataToServer()
    }
    //MARK: Resend pin code
    @IBAction func resendPinCode(_ sender: Any) {
        sendSignInDataToServer()
    }
    //MARK: Post Sign in data
    private func sendSignInDataToServer() {
        let urlString = "https://meenaclick.com/api/v2/login-check"
        
        Alamofire.request(urlString, method: .post, parameters: ["mobile_no": mobileNumber.text!],encoding: JSONEncoding.default, headers: nil).responseJSON {
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

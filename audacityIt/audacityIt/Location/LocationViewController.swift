//
//  LocationViewController.swift
//  audacityIt
//
//  Created by RASHED on 6/15/19.
//  Copyright © 2019 rashed. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LocationViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate {
    
    @IBOutlet var selectZone: UITextField!
    @IBOutlet var selectZoneTextField: UITextField!
    @IBOutlet var selectAreaTextField: UITextField!
    
    var allAreadata: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createPickerView()
        dismissPickerView()
        downloadJson()
    }
    
    //MARK:PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return priorityTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return priorityTypes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPriority = priorityTypes[row]
        selectZoneTextField.text = selectedPriority
    }
    
    var selectedPriority: String?
    var priorityTypes = ["Mohammadpur","Lalmatia","Farmgate","Banasree","Rampura","Malibag"]
    
    func createPickerView(){
        let pickerView = UIPickerView()
        pickerView.delegate = self
        selectZoneTextField.inputView = pickerView
    }
    
    @objc func dismissPickerView(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dismissKeyBoard))
        toolBar.setItems([doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        selectZoneTextField.inputAccessoryView = toolBar
        
    }
    
    @objc func dismissKeyBoard(){
        view.endEditing(true)
    }
    
    
    //MARK: Parse data
    func downloadJson(){
        
        Alamofire.request("https://meenaclick.com/api/get-all-area").responseJSON{ (response) -> Void in
            
            if response.result.isSuccess{
                let swiftyJson = JSON(response.data!)
                print(swiftyJson)
                self.selectZone.text = swiftyJson["data"][0]["area_name"].stringValue
            }
        }
    }
}

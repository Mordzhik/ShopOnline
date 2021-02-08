//
//  SMSViewController.swift
//  AllMarket
//
//  Created by tse on 9/19/20.
//  Copyright © 2020 marzhan. All rights reserved.
//

import UIKit
import Alamofire


class SMSViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var number1: UITextField!
    
    @IBOutlet weak var number2: UITextField!
    
    @IBOutlet weak var number3: UITextField!
    
    @IBOutlet weak var number4: UITextField!
    @IBOutlet  var smsButton: UIButton!
    
    
    var phone: String?
    
    var numbers: String?
      
     /* init(phone: String) {
          super.init(nibName: nil, bundle: nil)
          self.phone = phone
      }

       required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }*/
    
    

    
   
         override func viewDidAppear(_ animated: Bool) {
             super.viewDidAppear(animated)
            
            number1.delegate = self
            number2.delegate = self
            number3.delegate = self
            number4.delegate = self
    
            
            
          smsButton.addSoftUIEffectForButton(cornerRadius: smsButton.bounds.height/2)
         }

    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if ((textField.text!.count) < 1) && (string.count > 0) {
            
                  if textField == number1 {
                       number2.becomeFirstResponder()
                   }
                   if textField == number2 {
                       number3.becomeFirstResponder()
                   }
                   if textField == number3 {
                       number4.becomeFirstResponder()
                   }
                   if textField == number4 {
                       number4.becomeFirstResponder()
                   }
                   textField.text = string
                   return false
        
        } else if ((textField.text?.count)! >= 1) && (string.count == 0){
           
            if textField == number2 {
                number1.becomeFirstResponder()
            }
            if textField == number3 {
                number2.becomeFirstResponder()
            }
            if textField == number4 {
                number3.becomeFirstResponder()
            }
            if textField == number1 {
                number1.becomeFirstResponder()
            }
            textField.text = ""
            return false
        }
            
            else if (textField.text!.count) >= 1 {
            textField.text = string
            return false
            
        }
        
        return true
       
    }

         override func didReceiveMemoryWarning() {
             super.didReceiveMemoryWarning()
            
         }

   
    func apiCall (){
           
           let mainPath: String = "http://allmarket.armenianbros.com/"

           let apiSignup = mainPath + "api/v2/auth/verify"
          
           var numbers = "\(number1.text)" + "\(number2.text)" + "\(number3.text)" + "\(number4.text)"
        
           
          
        
            let params = [
            "phone": self.phone,
            "code": numbers.trimmingCharacters(in: .whitespacesAndNewlines) as! AnyObject
           
            ] as [String : Any]
       
           let encodeURL = apiSignup
           let headers : HTTPHeaders  = [ "Accept": "application/json"]


           let requestofAPI =  AF.request(encodeURL, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers)
      
           requestofAPI.responseJSON { (response) in
               print (response.value ?? "no value")
           }.responseString{ (response) in
               print (response.value ?? "no value")
           }.authenticate(username: "dev@allmarket.kz", password: "dev")/*responseJSON(completionHandler: { response -> (Void) in
               print(response.request!)
               print(response.result)
               print(response.response)
               
           })*/
       }

}

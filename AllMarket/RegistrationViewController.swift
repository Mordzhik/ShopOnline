//
//  RegistrationViewController.swift
//  AllMarket
//
//  Created by tse on 9/18/20.
//  Copyright © 2020 marzhan. All rights reserved.
//

import UIKit
import Alamofire

class RegistrationViewController: UIViewController {

 

    
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var registrButton: UIButton!
    
    
    
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
        
       /*fetchURL(url: "http://allmarket.armenianbros.com/api/v2/auth/register", param: ["name":"Test User","phone":"+7(700)4242233","city_id":2])
        registrButton.addSoftUIEffectForButton(cornerRadius: registrButton.bounds.height/2)*/
        self.registrButton.layer.cornerRadius = 23.5
        self.registrButton.layer.borderWidth = 0.2
        self.registrButton.layer.borderColor = UIColor.blue.cgColor
        
           
       }
 
    @IBAction func buttonSignupTapped(_ sender: Any) {
        if userNameField.text! != ""  && numberField.text! != "" && cityField.text! != ""
        { //api
            apiCall()
            
        } else {
            let alert = UIAlertController(title: "", message: "Please all field are required", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler:{
                action in print("Close")
            })
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
      /* func fetchURL(url : String, param : [String:Any]) {
           AF.request(url, method: .post, parameters: param).responseString { (response) in
               print (response.value ?? "no value")
           }.responseJSON { (response) in
               print (response.value ?? "no value")
           }.authenticate(username: "dev@allmarket.kz", password: "dev")
       }
    */

       override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
          
       }
    
     func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destination as! SMSViewController
        controller.phone = numberField.text
    }
    
    
   // @IBAction func RegistrButton(_sender: Any){
        //let username = usernameField.text
       // let telephone = telephoneField.text
 //   }
    func apiCall (){
        
        let mainPath: String = "http://allmarket.armenianbros.com/"

        let apiSignup = mainPath + "api/v2/auth/register"

        let params = [
        "name": self.userNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines) as! AnyObject,
        "phone":self.numberField.text!.trimmingCharacters(in: .whitespacesAndNewlines) as! AnyObject,
        "city_id":self.cityField.text!.trimmingCharacters(in: .whitespacesAndNewlines) as! AnyObject
        ]
    
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

    /*  func presentCodeViewController() {
                     if let phone = numberField.text, phone.count == 14 {
                     let controller = SMSViewController(phone: phone)
                     present(controller, animated: true)
                     }
        }*/
        
    
}

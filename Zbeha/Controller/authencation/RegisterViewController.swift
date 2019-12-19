//
//  RegisterViewController.swift
//  Zbeha
//
//  Created by DP on 11/9/19.
//  Copyright © 2019 DP. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameReg: UITextField!
    @IBOutlet weak var emailRegs: UITextField!
    @IBOutlet weak var phoneRegs: UITextField!
    @IBOutlet weak var addressRegs: UITextField!
    @IBOutlet weak var passwordRegs: UITextField!
    @IBOutlet weak var confirmPassRegs: UITextField!
    

    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func registerBtn(_ sender: Any) {
        guard let name = nameReg.text    , !name.isEmpty else {return}
        guard let email = emailRegs.text , !email.isEmpty else{return}
        guard let phone = phoneRegs.text , !phone.isEmpty else{return}
       // guard let address = addressRegs.text , !address.isEmpty else{return}
        guard let password = passwordRegs.text , !password.isEmpty else{return}
        guard let confirmpassword = confirmPassRegs.text , !confirmpassword.isEmpty else{return}
        
        Api.register(name: name, password: password, confirmpassword: confirmpassword, email: email, phone: phone, lat: "ddddd", long: "dddwdw")
        {
        (error: Error?, success: Bool) in
        if success
        {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let secondePage = storyBoard.instantiateViewController(withIdentifier: "tabBarViewController") as! tabBarViewController
            self.present(secondePage, animated: true, completion: nil)
            
            
            
            
        }
        else{
            print(error as Any)
        }
    }
    }
        
           
    
    

}


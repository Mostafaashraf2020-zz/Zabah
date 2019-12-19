//
//  ContactUsViewController.swift
//  Zbeha
//
//  Created by DP on 12/10/19.
//  Copyright © 2019 DP. All rights reserved.
//

import UIKit
import Alamofire

class ContactUsViewController: UIViewController {
    @IBOutlet weak var emailOrPasswordText: UITextField!
    @IBOutlet weak var MessageText: UITextField!
    var ContactUsData : (SendComplainModel)?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    
    
    
    @IBAction func sendMyContactBtn(_ sender: Any) {
      
        let nameormobile  = emailOrPasswordText.text!
        let messages = MessageText.text!
        let parameters = [ "name" : nameormobile ,
                           "complain" : messages ]
//        if  nameormobile.isEmpty || messages.isEmpty
//        {
//
//            let alertController = UIAlertController(
//                title: "خطا",
//                message:"من فضلك اكتب رقم الهاتف او الايمل الشخصي و الشكوي و سيتم التواصل معك",
//                preferredStyle:.alert)
//
//            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//            self.present(alertController, animated: true, completion: nil)
//
//
    let url = "https://zabeeeha.000webhostapp.com/public/api/complain"
    Alamofire.request(url, method:.post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
    .responseJSON{ respones in
    do {
    let decoder = JSONDecoder()
    let ContactUsData =  try decoder.decode(SendComplainModel.self, from: respones.data!)
    self.ContactUsData = ContactUsData
    
    if ContactUsData.stat == 200
    {
    print("success")
    
    
    let alertController = UIAlertController(
    title: "تنبيه",
    message:"تم ارسال الشكوي و سيتم التواصل معك علي الفور ",
    preferredStyle:.alert)
    
    alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
    self.present(alertController, animated: true, completion: nil)
        
    
    }
    else
    {
    print("erorr")
    }
    } catch let error
    {
    print(error.localizedDescription)
    
    }
    }
    }
    }







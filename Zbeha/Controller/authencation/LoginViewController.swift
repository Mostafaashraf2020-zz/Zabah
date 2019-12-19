//
//  LoginViewController.swift
//  Zbeha
//
//  Created by DP on 11/9/19.
//  Copyright © 2019 DP. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    var myData : Category?
    var idUser: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
   
   
    @IBAction func loginBtn(_ sender: Any) {
        
         let name     = emailTxt.text!
         let password = passwordTxt.text!
        let parameters = [ "name" : name ,
                            "password" : password ]
        
        if name.isEmpty || password.isEmpty
        {
            
            let alertController = UIAlertController(
                title: "Error",
                message:"Email or password is empty",
                preferredStyle:.alert)
            
            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)

            
        }
        let url = "https://zabeeeha.000webhostapp.com/public/api/login?"
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON{ respones in
                switch respones.result
                {
                case .failure(let error) :
                    print(error)
                case.success(  _):
                    do{
                        
                    let decoder = JSONDecoder()
                    let myData = try
                    decoder.decode(Category.self, from: respones.data!)
                    self.myData = myData
                        if  myData.stat == 200
                        {
                           print("success")
                         // save userId
                            self.idUser =  myData.user?.id
                            UserDefaults.standard.set(self.idUser, forKey: "userid")
                            print(self.idUser!)
                            
                                    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                                let secondePage = storyBoard.instantiateViewController(withIdentifier: "tabBarViewController") as! tabBarViewController
                                                self.present(secondePage, animated: true, completion: nil)
                        }
                        else                        {
                            let alertController = UIAlertController(
                                title: "Error",
                                message:"Invalid Email or Password",
                                preferredStyle:.alert)

                            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                            self.present(alertController, animated: true, completion: nil)

                            
                           print("error")
                        }
                    } catch let error
                    {
                        print(error.localizedDescription)
                        
                    }


                    
                    }
                    
                }
           
         
           
        }
    }
    


//
//  Api.swift
//  Zbeha
//
//  Created by DP on 11/23/19.
//  Copyright © 2019 DP. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class Api: NSObject {
    
//    class func login (name:String , password : String , completion : @escaping (_ errpr : Error? , _ success: Bool) -> Void) {
//        let parameters = [ "name" : name ,
//                           "password" : password ]
//        let url = "https://zabeeeha.000webhostapp.com/public/api/login?"
//
//        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
//            .validate(statusCode: 200..<300)
//            .responseJSON{ respones in
//                switch respones.result
//                {
//                case .failure(let error) :
//                    completion(error,false)
//                    print(error)
//                case.success(let value):
//                    completion(nil,true)
//                    //print(value)
//
//                }
//
//        }
//
//    }
    
    class func register (name:String , password : String , confirmpassword : String,email : String ,phone : String , lat : String ,long : String   , completion : @escaping (_ errpr : Error? , _ success: Bool) -> Void) {
        let parameters = [
            "name" :  name  ,
            "password": password,
            "confirmpassword": confirmpassword ,
            "email": email  ,
            //  "address" : address ,
            "lat": "rerere",
            "long": "x",
            "phone" :phone
            
        ]
        let url = "https://zabeeeha.000webhostapp.com/public/api/register"
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<300)
            .responseJSON{ respones in
                switch respones.result
                {
                case .failure(let error) :
                    completion(error,false)
                    print(error)
                case.success(_):
                    completion(nil,true)
                   // print(value)
                    
                }
                
        }
        
    }
    
   
    

    
    

}


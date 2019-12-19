//
//  branchesViewController.swift
//  Zbeha
//
//  Created by DP on 11/16/19.
//  Copyright © 2019 DP. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class branchesViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var categoryCollection: UICollectionView!
    
    
    var id_product : String?
    var myCat : Category?
    var id_pro : String = ""
    var AtToCart : AtToCartModel?
let userID = UserDefaults.standard.object(forKey: "userid")
    var params = [String : Any ] ()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        
        getCategory()
      
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (myCat?.product!.count ??  0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "branches", for: indexPath) as! branchesCollectionViewCell
      
       cell.image.sd_setImage(with: URL(string:  ((myCat?.product?[indexPath.row].img)!)), placeholderImage: UIImage(contentsOfFile: "a"), options: .handleCookies, completed: nil)
        cell.names?.text = String((myCat?.product?[indexPath.row].text_of_img!)!)
        
        
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width:0,height: 2.0)
        //cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false;
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        return cell
    
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 10.0
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
       
       
     
    }
  
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: (collectionView.frame.width / 1) - 1 , height: 310)
            
        }
        
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("is selected")
        id_pro =  (myCat?.product?[indexPath.row].id)!
        print(id_pro)
        
        
    
        
        let alertController = UIAlertController(
        title: "منتج",
        message: "هل تود شراء هذا المنتج",
        preferredStyle:.alert)

        alertController.addAction(UIAlertAction(title: "نعم", style: .default, handler: { (action) in
            switch action.style
            {
            case.default:
                print("ok")
                self.sendID()
                case .cancel:
                print("no")
            case .destructive:
                print("yes")
            @unknown default:
                print("ok")
            }
        }
))

        alertController.addAction(UIAlertAction(title: "لا", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)



    }
    
    func getCategory()  {
        let urlHome = "https://zabeeeha.000webhostapp.com/public/api/category?id_product=\(id_product ?? "00")"
        
        Alamofire.request(urlHome, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .responseJSON{ respones in
                do {
                    let decoder = JSONDecoder()
                    let myCat =  try decoder.decode(Category.self, from: respones.data!)
                    self.myCat=myCat
                    self.categoryCollection.reloadData()

                  
                    
                    
                    
                } catch let error
                {
                    print(error.localizedDescription)
                    
                }
                
            
    }
   
}
   
    
    func sendID()  {
        params = ["id_product" : id_pro ,"id_user" : userID!]
         let urlProduct = "https://zabeeeha.000webhostapp.com/public/api/product"

        Alamofire.request(urlProduct, method: .post, parameters: params , encoding: URLEncoding.default, headers: nil)
        .responseJSON { respones in
            do {
                let decoder = JSONDecoder()
                let AtToCart =  try decoder.decode(AtToCartModel.self, from: respones.data!)
                self.AtToCart=AtToCart
                if AtToCart.stat  == 200 {

                    print("success")
                }else
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

//
//  CartViewController.swift
//  Zbeha
//
//  Created by Mostafa Ashraf on 12/2/19.
//  Copyright © 2019 DP. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage


class CartViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    
    
    fileprivate var totalAmount:Double = 0.0 {
        didSet{
            
            totalPrice.text = String(totalAmount)
        }
    }
    
   
  
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var cartCollectionView: UICollectionView!
    let CartCollectionViewCellId = "CartCollectionViewCell"
    let userId = UserDefaults.standard.object(forKey: "userid")
     var cartData : CartMasterModel?
    var id_product  = [String:Int] ()
    var numberOfProduct : String?
    var endOrder :finalOrderModel?

   
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      

        
        let nibcell = UINib(nibName: CartCollectionViewCellId, bundle: nil)
        cartCollectionView.register(nibcell, forCellWithReuseIdentifier: CartCollectionViewCellId)
        GetCartPro()
       
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if ((cartData?.order?.count) != nil) {
            return (cartData?.order!.count ??  0)
        }else{
            
        return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CartCollectionViewCellId, for: indexPath) as! CartCollectionViewCell
        
           cell.delegate = self
        cell.stepperOutlet.maximumValue = Double(cartData?.order?[indexPath.row].max_count ?? "0") ?? 0
        
     cell.configCell(myModel: (cartData?.order?[indexPath.row])!)
        
      //  self.numberOfProduct = cell.counterPro.text
    
      
    
       
        
       
    
        
        
        
        return cell
        
    
      
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       return CGSize(width: (collectionView.frame.width / 2) - 1 , height: 260)

    }
    
    func GetCartPro()  {
        let params = ["id_user": userId]
        let CartUrl = "https://zabeeeha.000webhostapp.com/public/api/cart"
        Alamofire.request(CartUrl, method: .post, parameters: params as Parameters, encoding:  URLEncoding.default, headers: nil)
            .responseJSON{ respones in
                do {
                    let decoder = JSONDecoder()
                    let cartData =  try decoder.decode(CartMasterModel.self, from: respones.data!)
                    self.cartData = cartData
                    self.cartCollectionView.reloadData()
                    if cartData.stat == 200
                    {
                        print("sucess")
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
    
    @IBAction func orderButn(_ sender: Any) {
        
        
        let oderUrl = "https://zabeeeha.000webhostapp.com/public/api/endorder"
    
        for (index, numberOfId) in ((cartData?.order?.enumerated())!) {

            id_product  ["id_product[\(index)]"] = numberOfId.id
            id_product ["count_of_product[\(index)]"] = numberOfId.countOfUser


        }
        id_product ["total"] = Int(totalAmount)
        id_product ["id_user"] = userId as? Int
        

        Alamofire.request(oderUrl, method: .post, parameters: id_product, encoding: URLEncoding.default, headers: nil)
            .responseJSON{ respones in
                switch respones.result
                {
                case .failure(let error) :
                    print(error)
                case.success(  _):
                    do{

                        let decoder = JSONDecoder()
                        let endOrder = try
                            decoder.decode(finalOrderModel.self, from: respones.data!)
                        self.endOrder = endOrder
                        if  endOrder.stat == 200
                        {
                            print("success")

                            let alertController = UIAlertController(
                                title: "تم ارسال طلبك بنجاح",
                                message:"تم ارسال طلبك بنجاح و سيتم توصيله في اسرع وقت ممكن",
                                preferredStyle:.alert)

                            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                            self.present(alertController, animated: true, completion: nil)
                            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                            let secondePage = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                            self.navigationController?.pushViewController(secondePage, animated: true)
                            

                        }
                        else
                        {

                            print("error")
                        }
                    }
                    catch let error
                    {
                        print(error.localizedDescription)

                    }



                }

        }




    }
    
    
    
    
    
    
    
    
}
extension CartViewController : CartViewCellDelegate {
    func updateCellItemCount(index: Int, count: Int) {
        self.cartData?.order![index].countOfUser = count
    }
    
    func onAmountChange(newAmount: Double, state: StepperState) {
        if state == .minus
        {
            self.totalAmount -= newAmount
            self.totalPrice.text = String(self.totalAmount)
        }
        else if state == .plus {
            self.totalAmount += newAmount
            self.totalPrice.text = String(self.totalAmount)
        }
    }
    
    func onAmountChange(newAmount: Double) {
        
        
        
    }
}

public enum StepperState {
    
    case plus
    case minus
}

protocol CartViewCellDelegate {
    
    func onAmountChange(newAmount: Double, state: StepperState)
    func updateCellItemCount(index:Int,count:Int)
    
}




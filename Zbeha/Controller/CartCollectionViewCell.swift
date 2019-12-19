//
//  CartCollectionViewCell.swift
//  Zbeha
//
//  Created by Mostafa Ashraf on 12/2/19.
//  Copyright © 2019 DP. All rights reserved.
//

import UIKit

class CartCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imagecartpro: UIImageView!
    @IBOutlet weak var nameCartPro: UILabel!
    @IBOutlet weak var counterPro: UILabel!
    @IBOutlet weak var pricepro: UILabel!
    @IBOutlet weak var stepperOutlet: UIStepper!
    var par : Order?
    var oldCount:Int = 0
     var countOfOrder:Int = 0
    var delegate:CartViewCellDelegate!
   
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    var cartData : CartMasterModel?
    
    
   
    @IBAction func stepperAct(_ sender: Any) {


        if oldCount  > Int(stepperOutlet.value) {
            
            delegate.onAmountChange(newAmount: stepperOutlet.stepValue * Double((par?.price)!)!, state: .minus)
            
        }
            
        else {
            delegate.onAmountChange(newAmount: stepperOutlet.stepValue * Double((par?.price)!)!, state: .plus)
        }
        
        counterPro.text = String(Int(stepperOutlet.value))
        oldCount = Int(stepperOutlet.value)
        pricepro?.text = String(stepperOutlet.value * Double((par?.price)!)!) + "" + "ر س"
        
        par?.countOfUser = Int(stepperOutlet.value)
        self.indexPath.flatMap { //print($0.item)
            self.delegate.updateCellItemCount(index: $0.item, count: Int(stepperOutlet.value))

    }
    }
    
    func configCell(myModel:Order) {
       
        par = myModel
        
                imagecartpro.sd_setImage(with: URL(string:  ((par?.img)!)), placeholderImage: UIImage(contentsOfFile: "a"), options: .handleCookies, completed: nil)
                nameCartPro?.text = par?.text_of_img
        

        
    }
    
    
    
}
extension UIResponder {
    /**
     * Returns the next responder in the responder chain cast to the given type, or
     * if nil, recurses the chain until the next responder is nil or castable.
     */
    func next<U: UIResponder>(of type: U.Type = U.self) -> U? {
        return self.next.flatMap({ $0 as? U ?? $0.next() })
    }
}

extension UICollectionViewCell {
    var collectionView: UICollectionView? {
        return self.next(of: UICollectionView.self)
    }
    
    public var indexPath: IndexPath? {
        return self.collectionView?.indexPath(for: self)
    }
}


//
//  MycCellCollectionViewCell.swift
//  Zbeha
//
//  Created by DP on 11/12/19.
//  Copyright © 2019 DP. All rights reserved.
//

import UIKit

class MycCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageCellView: UIImageView!
    var image:UIImage! {
    didSet{
    imageCellView.image = image
    }
    }
}

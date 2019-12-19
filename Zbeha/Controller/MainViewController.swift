//
//  MainViewController.swift
//  Zbeha
//
//  Created by DP on 11/6/19.
//  Copyright © 2019 DP. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class MainViewController: UIViewController
    ,UICollectionViewDataSource
    ,UICollectionViewDelegate
,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var sliderCollection: UICollectionView!
    @IBOutlet weak var collectionBranches: UICollectionView!
    @IBOutlet weak var counterPage: UIPageControl!
    var SliderImages = [UIImage]()
    var currentIndex = 0
    var myData : Master?
    
    
    
  
    
    

    
    override func viewDidLoad() {
        self.navigationItem.hidesBackButton = true

        super.viewDidLoad()
        HomeApi()
       
        
        
        
        counterPage.numberOfPages = SliderImages.count
        sliderCollection.dataSource = self
        sliderCollection.delegate = self
        collectionBranches.delegate = self
        collectionBranches.dataSource = self
        
        self.view.addSubview(sliderCollection)
        self.view.addSubview(collectionBranches)
        
       
    }
    
    @IBAction func NaviToCart(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let secondePage = storyBoard.instantiateViewController(withIdentifier: "CartCollectionViewCell") as! CartViewController
        self.navigationController?.pushViewController(secondePage, animated: true)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.sliderCollection
        {
        return (myData?.slider!.count ??  0)
        }
        else
        {
            return (myData?.home!.count ??  0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.collectionBranches{
        
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collectionBranches.frame.size.width - space-3) / 2.0
       return CGSize(width: size, height: size)
        } else{
            
        
            let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
            let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
            let size:CGFloat = (collectionBranches.frame.size.width - space) / 1.0
            return CGSize(width: size, height: size)
        }
    }
     
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.sliderCollection
        {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as!
        SliderCellCollectionViewCell
            
            cell.imageSliderShow.sd_setImage(with: URL(string:  ((myData?.slider?[indexPath.row].img)!)), placeholderImage: UIImage(contentsOfFile: "a"), options: .handleCookies, completed: nil)
        //    cell.salesLabel.text! = String((myData?.slider?[indexPath.row].text_of_img)!)
          
           
            
        return cell
        } else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as!
            categoryCollectionViewCell
             cell.imageBranches.sd_setImage(with: URL(string: ((myData?.home?[indexPath.row].img)!)), placeholderImage: UIImage(contentsOfFile: "a"), options: .handleCookies, completed: nil)
            cell.layer.cornerRadius = 6.0
            let shadowPath2 = UIBezierPath(rect: cell.bounds)
            cell.layer.masksToBounds = true
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: CGFloat(1.0), height: CGFloat(3.0))
            cell.layer.shadowOpacity = 1.0
            cell.layer.shadowPath = shadowPath2.cgPath
//            cell.layer.cornerRadius = 6.0
//            layer.masksToBounds = true
            return cell
            
            
        }
        
    }
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentIndex = Int(scrollView.contentOffset.x / sliderCollection.frame.size.width)
        counterPage.currentPage = currentIndex
    }
    
    func HomeApi() -> Void {
        
        let urlHome = "https://zabeeeha.000webhostapp.com/public/api/home"
        
        Alamofire.request(urlHome, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .responseJSON{ respones in
              //  print(respones)
                
                do {
                    let decoder = JSONDecoder()
                    let myData =  try decoder.decode(Master.self, from: respones.data!)
                    self.myData=myData
                    self.sliderCollection.reloadData()
                    self.collectionBranches.reloadData()
                   
                    
                    
                } catch let error
                {
                    print(error.localizedDescription)
                    
                }
        }
      
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.collectionBranches
        {
          
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
      let secondePage = storyBoard.instantiateViewController(withIdentifier: "branches") as! branchesViewController
            
            
            secondePage.id_product = myData?.home?[indexPath.row].id
            print(myData?.home?[indexPath.row].id as Any)
            self.navigationController?.pushViewController(secondePage, animated: true)
            
          
        }
    }
    
    
    
    
    
    
    
        
    }
    
    
    





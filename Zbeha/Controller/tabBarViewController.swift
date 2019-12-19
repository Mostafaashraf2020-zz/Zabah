//
//  tabBarViewController.swift
//  Zbeha
//
//  Created by DP on 11/6/19.
//  Copyright © 2019 DP. All rights reserved.
//

import UIKit

class tabBarViewController: UITabBarController {
    var tb = UITabBarItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        
        let selectedImageAdd1 = UIImage(named: "house.png")?.withRenderingMode(.alwaysOriginal)
        let DeSelectedImageAdd1 = UIImage(named: "house.png")?.withRenderingMode(.alwaysOriginal)
        tb = (self.tabBar.items?[2])!
        tb.image = DeSelectedImageAdd1
        tb.selectedImage = selectedImageAdd1
        
        let selectedImageAdd2 = UIImage(named: "call.png")?.withRenderingMode(.alwaysOriginal)
        let DeSelectedImageAdd2 = UIImage(named: "call.png")?.withRenderingMode(.alwaysOriginal)
        tb = (self.tabBar.items?[1])!
        tb.image = DeSelectedImageAdd2
        tb.selectedImage = selectedImageAdd2
        
        
        let selectedImageAdd4 = UIImage(named: "suggest.png")?.withRenderingMode(.alwaysOriginal)
        let DeSelectedImageAdd4 = UIImage(named: "suggest.png")?.withRenderingMode(.alwaysOriginal)
        tb = (self.tabBar.items?[0])!
        tb.image = DeSelectedImageAdd4
        tb.selectedImage = selectedImageAdd4
        // initaial tab bar index
        self.selectedIndex = 2
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

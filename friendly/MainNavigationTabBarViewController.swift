//
//  MainNavigationTabBarViewController.swift
//  friendly
//
//  Created by Daniel Christopher on 5/30/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit

class MainNavigationTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTab(tabBar.items![0])
        configureTab(tabBar.items![1])
        configureTab(tabBar.items![2])
    }

    func configureTab(tab: UITabBarItem) {
        let originalImage2 = tab.selectedImage?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        tab.selectedImage = originalImage2
        tab.image = originalImage2
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

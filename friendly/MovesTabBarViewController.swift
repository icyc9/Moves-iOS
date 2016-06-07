//
//  MovesTabBarViewController.swift
//  friendly
//
//  Created by Daniel Christopher on 5/31/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit

class MovesTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let VC1 = UIViewController()
        VC1.view.backgroundColor = UIColor(red: 0.19, green: 0.36, blue: 0.60, alpha: 1.0)
        VC1.title = "Recent"
        let VC2 = UIViewController()
        VC2.view.backgroundColor = UIColor(red: 0.70, green: 0.23, blue: 0.92, alpha: 1.0)
        VC2.title = "Random"
        let VC3 = UIViewController()
        VC3.view.backgroundColor = UIColor(red: 0.17, green: 0.70, blue: 0.27, alpha: 1.0)
        VC3.title = "Recent"
        
        
        setViewControllerArray([VC1, VC2, VC3])
        setFirstViewController(0)
        setSelectionBar(80, height: 3, color: UIColor(red: 0.23, green: 0.55, blue: 0.92, alpha: 1.0))
        setButtonsWithSelectedColor(UIFont.systemFontOfSize(18), color: UIColor.blackColor(), selectedColor: UIColor(red: 0.23, green: 0.55, blue: 0.92, alpha: 1.0))
        
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(self.push(_:)))
        setNavigationWithItem(UIColor.whiteColor(), leftItem: barButtonItem, rightItem: nil)
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

//
//  MovesViewController.swift
//  friendly
//
//  Created by Daniel Christopher on 6/1/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit

class MovesViewController: UIViewController {
    var pageMenu : CAPSPageMenu?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        let myMovesController = storyboard!.instantiateViewControllerWithIdentifier("accepted_moves")
        myMovesController.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        myMovesController.title = "My Moves"

        self.addChildViewController(myMovesController)
        self.view.addSubview(myMovesController.view)
        myMovesController.didMoveToParentViewController(self)
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

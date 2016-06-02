//
//  AcceptedMovesViewController.swift
//  friendly
//
//  Created by Daniel Christopher on 6/1/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit

class AcceptedMovesViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let primary = UIColor(red: 0.13, green: 0.59, blue: 0.95, alpha: 1)
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.barTintColor = primary
        navigationBar?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationBar?.topItem?.title = "My Moves"
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

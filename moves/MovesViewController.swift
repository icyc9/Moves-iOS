//
//  MovesViewController.swift
//  friendly
//
//  Created by Daniel Christopher on 6/1/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit
import RealmSwift
import RxSwift
import RxCocoa

class MovesViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        
        let myMovesController = storyboard!.instantiateViewControllerWithIdentifier("user_moves")
        
        myMovesController.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        myMovesController.title = "Your Moves"
        
        self.addChildViewController(myMovesController)
        self.view.addSubview(myMovesController.view)
        myMovesController.didMoveToParentViewController(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

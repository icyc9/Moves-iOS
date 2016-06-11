//
//  SendMoveViewController.swift
//  moves
//
//  Created by Daniel Christopher on 6/10/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit

class SendMoveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let verticalPageController = self.parentViewController?.parentViewController as! UIPageViewController
        let horizontalPageController = self.parentViewController?.parentViewController?.parentViewController as! UIPageViewController
        self.toggleScrollOnPageViewController(false, pageViewController: verticalPageController)
        self.toggleScrollOnPageViewController(false, pageViewController: horizontalPageController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func goBack(sender: UIBarButtonItem) {
        let verticalPageController = self.parentViewController?.parentViewController as! UIPageViewController
        let horizontalPageController = self.parentViewController?.parentViewController?.parentViewController as! UIPageViewController
        self.toggleScrollOnPageViewController(true, pageViewController: verticalPageController)
        self.toggleScrollOnPageViewController(true, pageViewController: horizontalPageController)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    private func toggleScrollOnPageViewController(scrollEnabled: Bool, pageViewController: UIPageViewController) {
        for view in pageViewController.view.subviews {
            if let subView = view as? UIScrollView {
                subView.scrollEnabled = scrollEnabled
            }
        }
    }
}

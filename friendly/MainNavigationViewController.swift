//
//  MainNavigationViewController.swift
//  friendly
//
//  Created by Daniel Christopher on 6/2/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit

class MainNavigationViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    private(set) lazy var pages: [UIViewController] = {
        return [self.createPage("find_moves"),
                self.createPage("make_moves_profile_navigation"),
                self.createPage("moves")]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        dataSource = self
        
        if let firstViewController = pages.last {
            setViewControllers([firstViewController],
                               direction: .Forward,
                               animated: true,
                               completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.indexOf(viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        return pages[previousIndex]
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.indexOf(viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let numberOfPages = pages.count
        
        guard numberOfPages > nextIndex else {
            return nil
        }
        
        return pages[nextIndex]
    }
    
    private func createPage(storyboardId: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle:nil).instantiateViewControllerWithIdentifier(storyboardId)
    }
}


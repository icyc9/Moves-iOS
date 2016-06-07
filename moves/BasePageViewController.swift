//
//  BasePageViewController.swift
//  friendly
//
//  Created by Daniel Christopher on 6/6/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit

class BasePageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var pages: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
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
    
    internal func showFirstPage() {
        if let firstViewController = pages.first {
            setViewControllers([firstViewController],
                               direction: .Forward,
                               animated: true,
                               completion: nil)
        }
    }
    
    internal func showLastPage() {
        if let firstViewController = pages.last {
            setViewControllers([firstViewController],
                               direction: .Forward,
                               animated: true,
                               completion: nil)
        }
    }
    
    internal func createPage(storyboardId: String, storyboardName: String) -> UIViewController {
        return UIStoryboard(name: storyboardName, bundle:nil).instantiateViewControllerWithIdentifier(storyboardId)
    }
}

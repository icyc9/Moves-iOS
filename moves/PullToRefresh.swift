//
//  PullToRefresh.swift
//  moves
//
//  Created by Daniel Christopher on 6/10/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit
import DGElasticPullToRefresh

extension UITableView {
    
    func setUpPullToRefresh(color: UIColor) {
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        loadingView.tintColor = UIColor.whiteColor()
        self.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1.5 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
                self!.dg_stopLoading()
            })
            }, loadingView: loadingView)
        self.dg_setPullToRefreshFillColor(color)
        self.dg_setPullToRefreshBackgroundColor(backgroundColor!)
    }
}
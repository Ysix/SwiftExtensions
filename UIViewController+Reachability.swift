//
//  UIViewController+Reachability.swift
//  
//
//  Created by Eddy Claessens on 23/06/16.
//  Copyright © 2016 Eddy Claessens. All rights reserved.
//

import UIKit

public let ReachabilityChangedNotification = "ReachabilityChangedNotification"

protocol ReachabilityDelegate {
    func reachabilityChanged(internetReachable: Bool) // This method should be used for disable or enable part of the interface (add or submit buttons, ...)
}

protocol ReachabilityManager {
    var internetReachable: Bool { get }
}

extension UIViewController {

    var internetReachable: Bool {
        get {
            guard let reachabilityManager = UIApplication.sharedApplication().delegate as? ReachabilityManager else {
                assert(false, "AppDelegate is not implementing ReachabilityManager")
                return false
            }
            return reachabilityManager.internetReachable
        }
    }

    func startListeningReachability() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(UIViewController.reachabilityChanged), name: ReachabilityChangedNotification, object: nil)
        self.reachabilityChanged()
    }

    func reachabilityChanged() {
        guard let reachabilityManager = UIApplication.sharedApplication().delegate as? ReachabilityManager else {
            assert(false, "AppDelegate is not implementing ReachabilityManager")
            return
        }
        if let reachabilityDelegate = self as? ReachabilityDelegate {
            reachabilityDelegate.reachabilityChanged(reachabilityManager.internetReachable)
        } else {
            assert(false, "\(String(self.dynamicType)) is not implementing ReachabilityDelegate")
        }
    }

    func stopListeningReachability() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: ReachabilityChangedNotification, object: nil)
    }
}

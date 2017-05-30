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
    func reachabilityChanged(_ internetReachable: Bool) // This method should be used for disable or enable part of the interface (add or submit buttons, ...)
}

protocol ReachabilityManager {
    var internetReachable: Bool { get }
}

extension UIViewController {

    var internetReachable: Bool {
        get {
            guard let reachabilityManager = UIApplication.shared.delegate as? ReachabilityManager else {
                assert(false, "AppDelegate is not implementing ReachabilityManager")
                return false
            }
            return reachabilityManager.internetReachable
        }
    }

    func startListeningReachability() {
        NotificationCenter.default.addObserver(self, selector: #selector(UIViewController.reachabilityChanged), name:Constants.InternNotification.internetReachabilityChanged.name, object: nil)
        self.reachabilityChanged()
    }

    func reachabilityChanged() {
        guard let reachabilityManager = UIApplication.shared.delegate as? ReachabilityManager else {
            assert(false, "AppDelegate is not implementing ReachabilityManager")
            return
        }
        if let reachabilityDelegate = self as? ReachabilityDelegate {
            reachabilityDelegate.reachabilityChanged(reachabilityManager.internetReachable)
        } else {
            assert(false, "\(String(describing: type(of: self))) is not implementing ReachabilityDelegate")
        }
    }

    func stopListeningReachability() {
        NotificationCenter.default.removeObserver(self, name: Constants.InternNotification.internetReachabilityChanged.name, object: nil)
    }
}

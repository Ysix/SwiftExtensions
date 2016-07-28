//
//  UINavigationController+ForwardedStatusBarPreference.swift
//  
//
//  Created by Eddy Claessens on 30/05/16.
//  Copyright © 2016 Eddy Claessens. All rights reserved.
//

import UIKit

extension UINavigationController {

    override public func preferredStatusBarStyle() -> UIStatusBarStyle {
        return self.visibleViewController!.preferredStatusBarStyle()
    }

}

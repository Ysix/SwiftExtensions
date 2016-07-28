//
//  UINavigationBar+BackgroundImage.swift
//
//
//  Created by Eddy Claessens on 21/03/16.
//  Copyright © 2016 Eddy Claessens. All rights reserved.
//

import UIKit


@IBDesignable extension UINavigationBar {

    @IBInspectable var clearBackground: Bool {
        get {
            return self.image?.size.height == 0 && self.imageCompact?.size.height == 0 && self.shadowHidden && self.translucent
        }
        set {
            if newValue {
                self.image = UIImage()
                self.imageCompact = UIImage()
                self.shadowHidden = true
            } else {
                self.image = nil
                self.imageCompact = nil
                self.shadowHidden = false
            }
        }
    }

    @IBInspectable var image: UIImage? {
        get {
            return self.backgroundImageForBarMetrics(.Default)
        }
        set {
            self.setBackgroundImage(newValue, forBarMetrics: .Default)
        }
    }

    @IBInspectable var imageCompact: UIImage? {
        get {
            return self.backgroundImageForBarMetrics(.Compact)
        }
        set {
            self.setBackgroundImage(newValue, forBarMetrics: .Compact)
        }
    }

    @IBInspectable var shadowHidden: Bool {
        get {
            return self.shadowImage?.size.height == 0
        }
        set {
            if newValue {
                self.shadowImage = UIImage()
            } else {
                self.shadowImage = nil
            }
        }
    }
}

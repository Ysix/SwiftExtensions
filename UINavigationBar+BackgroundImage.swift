//
//  UINavigationBar+Image.swift
//
//
//  Created by Eddy Claessens on 21/03/16.
//  Copyright © 2016 Eddy Claessens. All rights reserved.
//

import UIKit


@IBDesignable extension UINavigationBar {

    @IBInspectable var clear: Bool {
        get {
            return self.image?.size.height == 0 && self.imageCompact?.size.height == 0 && self.shadowHidden && self.isTranslucent
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
            return self.Image(for: .default)
        }
        set {
            self.setImage(newValue, for: .default)
        }
    }

    @IBInspectable var imageCompact: UIImage? {
        get {
            return self.Image(for: .compact)
        }
        set {
            self.setImage(newValue, for: .compact)
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

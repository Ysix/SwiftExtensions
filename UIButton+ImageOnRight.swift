//
//  UIButton+ImageOnRight.swift
//  
//
//  Created by Eddy Claessens on 26/05/16.
//  Copyright © 2016 Eddy Claessens. All rights reserved.
//

import UIKit

@IBDesignable extension UIButton {

    @IBInspectable var imageOnRight: Bool {
        get {
            return self.transform.tx == -1
        }
        set {
            if newValue {
                self.transform = CGAffineTransformMakeScale(-1.0, 1.0)
                self.titleLabel!.transform = CGAffineTransformMakeScale(-1.0, 1.0)
                self.imageView!.transform = CGAffineTransformMakeScale(-1.0, 1.0)
            }
        }
    }
}

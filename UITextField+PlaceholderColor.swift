//
//  UITextField+PlaceholderColor.swift
//  
//
//  Created by Eddy Claessens on 01/03/2017.
//  Copyright © 2017 Eddy Claessens. All rights reserved.
//

import UIKit

public extension UITextField {
    @IBInspectable var placeHolderColor : UIColor? {
        set {
            if let newValue = newValue, let placeholder = self.placeholder {
                self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSForegroundColorAttributeName:newValue])
            } else {
                //TODO
            }
        }
        get {
            return nil //TODO
        }
    }
}

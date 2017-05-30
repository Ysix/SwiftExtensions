//
//  UIButton+InteractiveColor.swift
//  
//
//  Created by Eddy Claessens on 10/08/16.
//  Copyright © 2016 Eddy Claessens. All rights reserved.
//

import UIKit

extension UIButton {

    @IBInspectable var interactiveColor: Bool { // this works better on .custom type buttons
        get {
            return self.Image(for: UIControlState())?.size == CGSize(width: 1, height: 1) //SHAME: how can we return it for sure ? Check if the pixel's color of bkgImg is the same as  ?
        }
        set {
            if newValue {
                self.setImage(UIImage.imageWithColor(color: self.Color!), for: UIControlState())
                self.Color = UIColor.clear
            }
        }
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

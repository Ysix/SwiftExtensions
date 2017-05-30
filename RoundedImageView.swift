//
//  RoundedImageView.swift
//  
//
//  Created by Eddy Claessens on 25/04/16.
//  Copyright © 2016 Eddy Claessens. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    override func layoutSubviews() {
        self.layer.cornerRadius = min(self.frame.size.width, self.frame.size.height) / 2
    }
}

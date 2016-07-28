//
//  UIView+Fade.swift
//  
//
//  Created by Eddy Claessens on 23/06/16.
//  Copyright © 2016 Eddy Claessens. All rights reserved.
//

import UIKit

extension UIView {
    enum FadeStyle {
        case In
        case Out
        case Update(updates: () -> ())
    }

    func fade(style: FadeStyle, duration: NSTimeInterval = 0.3) {
        switch style {
        case .In:
            guard !(alpha == 1 && hidden == false) else {
                break
            }
            self.alpha = 0
            self.hidden = false
            UIView.animateWithDuration(duration, animations: {
                self.alpha = 1
            })
        case .Out:
            guard !(alpha == 0 && hidden == true) else {
                break
            }
            UIView.animateWithDuration(duration, animations: {
                self.alpha = 0
                }, completion: { _ in
                    self.hidden = true
            })
        case .Update(let updates):
            UIView.animateWithDuration(alpha == 0 ? 0 : duration, animations: {
                self.alpha = 0
                }, completion: { _ in
                    updates()
                    self.fade(.In)
            })
        }
    }
}

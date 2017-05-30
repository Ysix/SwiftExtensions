//
//  UITabBarItem+CustomBadge.swift
//  
//
//  Created by Eddy Claessens on 05/09/16.
//  Copyright © 2016 Eddy Claessens. All rights reserved.
//

import UIKit

extension UITabBarController {

    func setBadges(badgeValues: [String?], color: UIColor, font: UIFont = UIFont.systemFont(ofSize: 16)) {

        for view in self.tabBar.subviews {
            if view is CustomTabBadge {
                view.removeFromSuperview()
            }
        }

        for index in 0...badgeValues.count-1 {
            if let badgeValue = badgeValues[index] {
                addBadge(index: index, value: badgeValue, color: color, font: font)
            }
        }
    }

    func addBadge(index: Int, value: String, color: UIColor, font: UIFont) {
        let badgeView = CustomTabBadge()

        badgeView.clipsToBounds = true
        badgeView.textColor = UIColor.white
        badgeView.textAlignment = .center
        badgeView.font = font
        badgeView.text = value
        badgeView.Color = color
        badgeView.borderColor = UIColor.white
        badgeView.borderWidth = 2
        badgeView.tag = index
        tabBar.addSubview(badgeView)

        self.positionBadges()
    }

    func removeBadge(index: Int) {
        for view in self.tabBar.subviews {
            if view is CustomTabBadge && view.tag == index {
                view.removeFromSuperview()
            }
        }
    }

    override open func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.positionBadges()
    }

    // Positioning
    func positionBadges() {

        var tabbarButtons = self.tabBar.subviews.filter { (view: UIView) -> Bool in
            return view.isUserInteractionEnabled // only UITabBarButton are userInteractionEnabled
        }

        tabbarButtons = tabbarButtons.sorted(by: { $0.frame.origin.x < $1.frame.origin.x })

        for view in self.tabBar.subviews {
            if let badgeView = view as? CustomTabBadge {
                self.positionBadge(badgeView: badgeView, items:tabbarButtons, index: badgeView.tag)
            }
        }
    }

    func positionBadge(badgeView: UIView, items: [UIView], index: Int) {

        let itemView = items[index]
        let center = itemView.center

        let xOffset: CGFloat = 12
        let yOffset: CGFloat = -12
        badgeView.frame.size = CGSize(width: 15, height: 15)
        badgeView.center = CGPoint(x: center.x + xOffset, y: center.y + yOffset)
        badgeView.layer.cornerRadius = badgeView.bounds.height/2
        tabBar.bringSubview(toFront: badgeView)
    }
}

class CustomTabBadge: UILabel {}

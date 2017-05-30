//
//  UIView+LayerProperties.swift
//  
//
//  Created by Eddy Claessens on 02/06/2016.
//  Copyright © 2016 Eddy Claessens. All rights reserved.
//

import UIKit

public extension UIView {
	@IBInspectable var cornerRadius: CGFloat {
		get {
			return layer.cornerRadius
		}
		set {
			layer.cornerRadius = newValue
			layer.masksToBounds = newValue > 0
		}
	}

	@IBInspectable var borderWidth: CGFloat {
		get {
			return layer.borderWidth
		}
		set {
			layer.borderWidth = newValue
		}
	}

	@IBInspectable var borderColor: UIColor {
		get {
			return UIColor(cgColor: layer.borderColor!)
		}
		set {
			layer.borderColor = newValue.cgColor
		}
	}
}

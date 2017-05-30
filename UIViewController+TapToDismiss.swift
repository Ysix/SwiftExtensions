//
//  FieldsDelegate+TapToDismiss.swift
//  
//
//  Created by Eddy Claessens on 12/05/2017.
//  Copyright © 2017 Eddy Claessens. All rights reserved.
//

import UIKit

extension UIViewController: UIGestureRecognizerDelegate {
    func addTapToDismissGestureRecognizer(targetView: UIView? = nil) {
        let tapGR = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
//        tapGR.delegate = self
        (targetView ?? self.view).addGestureRecognizer(tapGR)
    }
}

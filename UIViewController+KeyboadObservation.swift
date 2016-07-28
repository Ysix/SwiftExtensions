//
//  UIViewController+KeyboadObservation.swift
//
//
//  Created by Eddy Claessens on 14/04/16.
//  Copyright © 2016 Eddy Claessens. All rights reserved.
//

import UIKit

protocol KeyboardObserverDelegate {
    func keyboardWillMove(to height: CGFloat)
}

extension UIViewController {

    func startObservingKeyboard() // call it from viewWillAppear
    {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(UIViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(UIViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }

    func stopObservingKeyboard() // call it from viewWillDissappear
    {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }

    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.CGRectValue() {
            // swiftlint:disable:next force_cast
            (self as! KeyboardObserverDelegate).keyboardWillMove(to: keyboardSize.height)
        }
    }

    func keyboardWillHide(notification: NSNotification) {
        // swiftlint:disable:next force_cast
        (self as! KeyboardObserverDelegate).keyboardWillMove(to: 0)
    }
}

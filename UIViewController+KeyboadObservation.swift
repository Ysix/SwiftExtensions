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
        NotificationCenter.default.addObserver(self, selector: #selector(UIViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(UIViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    func stopObservingKeyboard() // call it from viewWillDissappear
    {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            // swiftlint:disable:next force_cast
            (self as! KeyboardObserverDelegate).keyboardWillMove(to: keyboardSize.height)
        }
    }

    func keyboardWillHide(_ notification: Notification) {
        // swiftlint:disable:next force_cast
        (self as! KeyboardObserverDelegate).keyboardWillMove(to: 0)
    }
}

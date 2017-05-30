//
//  String+FormatCheck.swift
//  
//
//  Created by Eddy Claessens on 31/05/16.
//  Copyright © 2016 Eddy Claessens. All rights reserved.
//

import Foundation

extension String {
    var isValidEmail: Bool { // contains an @ and at least 1 dot after : see https://davidcel.is/posts/stop-validating-email-addresses-with-regex/
        let emailRegex = ".+@.+\\..+"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
}

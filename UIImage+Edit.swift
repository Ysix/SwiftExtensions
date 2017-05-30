//
//  UIImage+Edit.swift
//  
//
//  Created by Eddy Claessens on 14/03/2017.
//  Copyright © 2017 Eddy Claessens. All rights reserved.
//

import UIKit

extension UIImage {

    func scale(withMaxSize maxSize: CGFloat) -> UIImage {
        var scaleFactor = maxSize/size.width
        if size.width < size.height {
            scaleFactor = maxSize/size.height
        }

        let newWidth = size.width * scaleFactor
        let newHeight = size.height * scaleFactor

        UIGraphicsBeginImageContext(CGSize(width: CGFloat(newWidth), height: CGFloat(newHeight)))
        draw(in: CGRect(x: 0, y: 0, width: CGFloat(newWidth), height: CGFloat(newHeight)))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }

    func toSquare() -> UIImage {
        guard size.width != size.height else {
            return self
        }

        let cgImage = self.cgImage!

        let refWidth = cgImage.width
        let refHeight = cgImage.height

        let goalSize: Int = Int(size.width > size.height ? size.height : size.width)

        let x = (refWidth - goalSize) / 2
        let y = (refHeight - goalSize) / 2
        let cropSquare = CGRect(x: x, y: y, width: goalSize, height: goalSize)
        let imageRef = self.cgImage!.cropping(to: cropSquare);
        return UIImage(cgImage: imageRef!, scale: self.scale, orientation: self.imageOrientation)
    }
    
}

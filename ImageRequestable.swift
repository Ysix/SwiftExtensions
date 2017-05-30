//
//  UiViewController+ImagePicker.swift
//  
//
//  Created by Eddy Claessens on 14/03/2017.
//  Copyright © 2017 Eddy Claessens. All rights reserved.
//

import UIKit

protocol ImageRequestable : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	func requestImage(allowEditing: Bool)
	func imagePicked(image: UIImage?)
}

extension ImageRequestable where Self: UIViewController {
    func requestImage(allowEditing: Bool = false) {

        let bundle = Bundle.main
        let tableName = "ImageRequestable"

        let imagePickerBlock : (UIImagePickerControllerSourceType) -> () = { (source) in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.sourceType = source
            self.present(imagePicker, animated: true, completion: nil)
        }

        var possibleActions : [(source: UIImagePickerControllerSourceType, text: String)] = []

        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            possibleActions.append((source: .camera, text: NSLocalizedString("RequestImage_action_take", tableName: tableName, bundle: bundle, comment: "")))
        }
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            possibleActions.append((source: .photoLibrary, text: NSLocalizedString("RequestImage_action_choose", tableName: tableName, bundle: bundle, comment: "")))
        }

        if possibleActions.count > 1 {
            let alert = UIAlertController(title: NSLocalizedString("RequestImage_alert_title", tableName: tableName, bundle: bundle, comment: ""),
                                          message: NSLocalizedString("RequestImage_alert_message", tableName: tableName, bundle: bundle, comment: ""),
                                          preferredStyle: .actionSheet)
            for action in possibleActions {
                alert.addAction(UIAlertAction(title: action.text   ,
                              style: UIAlertActionStyle.default, handler: { _ in
                                imagePickerBlock(action.source)
                }))
            }
            alert.addAction(UIAlertAction(title: NSLocalizedString("RequestImage_action_cancel", tableName: tableName, bundle: bundle, comment: ""),
                                          style: UIAlertActionStyle.cancel, handler: { (action) in
                                            self.imagePicked(image: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        } else if possibleActions.first != nil {
            imagePickerBlock(possibleActions.first!.source)
        }
    }
}

extension UIViewController {

	/*
	Can't do this in the protocol extension for now because @objc functions can not currently be in protocol extensions.
	If one day the protocol for UIImagePickerDelegate is done in swift you will be able to put it in the protocol extension :)
	*/

	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		self.dismiss(animated: true) {
			(self as? ImageRequestable)?.imagePicked(image: nil)
		}
	}

	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

		guard self as? ImageRequestable != nil else {
			return
		}

		let image = info[UIImagePickerControllerEditedImage] as? UIImage ?? info[UIImagePickerControllerOriginalImage] as! UIImage // change this if other media types are handled

		// objective-C code for orientation correction if needed someday

		//        if (image.imageOrientation != UIImageOrientationUp || _editedImage)
		//        {
		//            UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
		//            [image drawInRect:(CGRect){0, 0, image.size}];
		//            UIImage *normalizedImage = UIGraphicsGetImageFromCurrentImageContext();
		//            UIGraphicsEndImageContext();
		//            image = normalizedImage;
		//        }

		self.dismiss(animated: true, completion: {
			(self as? ImageRequestable)?.imagePicked(image:image)
		})
	}
}

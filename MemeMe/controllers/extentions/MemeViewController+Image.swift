//
//  MemeViewController+Image.swift
//  MemeMe-1.0
//
//  Created by Andy on 05.05.2020.
//  Copyright © 2020 AndyRadionov. All rights reserved.
//

import UIKit

extension EditMemeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func generateMemedImage() -> UIImage {
        hideToolbars(true)
        hideTextFieldsIfEmpty(true)
        view.endEditing(true)
        
        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        hideToolbars(false)
        hideTextFieldsIfEmpty(false)
        return memedImage
    }
    
    func pickImage(sourceType: UIImagePickerController.SourceType)  {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = sourceType
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        let infoKey: UIImagePickerController.InfoKey = picker.sourceType == .photoLibrary ? .originalImage : .editedImage
        if let image = info[infoKey] as? UIImage {
            imageView.image = image
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

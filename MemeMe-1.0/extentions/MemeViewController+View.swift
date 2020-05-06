//
//  MemeViewController+View.swift
//  MemeMe-1.0
//
//  Created by Andy on 06.05.2020.
//  Copyright © 2020 AndyRadionov. All rights reserved.
//

import UIKit

extension MemeViewController {
    
    func initViewsState() {
        imageView.image = nil
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        enableNavbarButtons(false)
        imageView.contentMode = .scaleAspectFit
        setupTextFieldStyle(textField: topTextField, defaultText: "TOP")
        setupTextFieldStyle(textField: bottomTextField, defaultText: "BOTTOM")
    }
    
    func enableNavbarButtons(_ enabled: Bool) {
        shareButton.isEnabled = enabled
        cancelButton.isEnabled = enabled
    }
    
    func hideToolbars(_ hide: Bool) {
        toolbar.isHidden = hide
        navbar.isHidden = hide
    }
}

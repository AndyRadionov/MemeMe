//
//  ViewController.swift
//  MemeMe-1.0
//
//  Created by Andy on 05.05.2020.
//  Copyright © 2020 AndyRadionov. All rights reserved.
//

import UIKit

class MemeViewController: UIViewController {

    @IBOutlet weak var navbar: UIToolbar!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var albumButton: UIBarButtonItem!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    let memeTextAttributes: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.strokeColor: UIColor.black,
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSAttributedString.Key.strokeWidth:  -4
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.contentMode = .scaleAspectFit
        initTextFields()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initViewsState()
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }

    @IBAction func shareMeme(_ sender: Any) {
        shareMeme()
    }
    
    @IBAction func cancel(_ sender: Any) {
        initViewsState()
    }
    
    @IBAction func pickAnImageFromAlbum(_ sender: Any) {
        pickImage(sourceType: .photoLibrary)
    }
    
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        pickImage(sourceType: .camera)
    }
    
    private func initViewsState() {
        imageView.image = nil
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        albumButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        shareButton.isEnabled = false
        cancelButton.isEnabled = false
        topTextField.text = "TOP"
        bottomTextField.text = "BOTTOM"
    }
}


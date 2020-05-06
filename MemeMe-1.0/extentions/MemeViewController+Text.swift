//
//  MemeViewController+Text.swift
//  MemeMe-1.0
//
//  Created by Andy on 05.05.2020.
//  Copyright © 2020 AndyRadionov. All rights reserved.
//

import UIKit

extension MemeViewController: UITextFieldDelegate {
    
    func setupTextFieldStyle(textField: UITextField, defaultText: String) {
        textField.delegate = self
        textField.defaultTextAttributes = memeTextAttributes
        textField.textAlignment = .center
        textField.autocapitalizationType = .allCharacters
        textField.attributedPlaceholder = NSAttributedString(string: defaultText, attributes: [.foregroundColor: UIColor.lightText])
    }
    
    func hideTextFieldsIfEmpty(_ hide: Bool) {
        hideTextFieldIfEmpty(textField: topTextField, hide: hide)
        hideTextFieldIfEmpty(textField: bottomTextField, hide: hide)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        enableNavbarButtons(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        if bottomTextField.isFirstResponder {
            view.frame.origin.y = -getKeyboardHeight(notification)
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        view.frame.origin.y = 0
    }
    
    private func hideTextFieldIfEmpty(textField: UITextField, hide: Bool) {
        if let isEmpty = textField.text?.isEmpty {
            textField.isHidden = hide && isEmpty
        }
    }
    
    private func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }
}

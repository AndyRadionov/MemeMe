//
//  MemeViewController+Text.swift
//  MemeMe-1.0
//
//  Created by Andy on 05.05.2020.
//  Copyright © 2020 AndyRadionov. All rights reserved.
//

import UIKit

extension MemeViewController: UITextFieldDelegate {
    
    func initTextFields() {
        topTextField.delegate = self
        bottomTextField.delegate = self
        topTextField.defaultTextAttributes = memeTextAttributes
        bottomTextField.defaultTextAttributes = memeTextAttributes
        topTextField.textAlignment = .center
        bottomTextField.textAlignment = .center
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (topTextField.isFirstResponder && textField.text == "TOP") || (bottomTextField.isFirstResponder && textField.text == "BOTTOM") {
            textField.text = ""
        }
        shareButton.isEnabled = true
        cancelButton.isEnabled = true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == topTextField && textField.text == "" {
            textField.text = "TOP"
        } else if textField == bottomTextField && textField.text == "" {
            textField.text = "BOTTOM"
        }
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
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        if bottomTextField.isFirstResponder {
            view.frame.origin.y = -getKeyboardHeight(notification)
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        view.frame.origin.y = 0
    }
    
    private func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }
}

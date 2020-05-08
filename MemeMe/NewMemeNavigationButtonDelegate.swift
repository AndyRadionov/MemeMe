//
//  EditMemeNavigationButtonDelegate.swift
//  MemeMe
//
//  Created by Andy on 08.05.2020.
//  Copyright © 2020 AndyRadionov. All rights reserved.
//

import UIKit

class NewMemeNavigationButtonDelegate: NSObject, UINavigationControllerDelegate {
    
    var viewController: UIViewController!
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(action)
        )
    }
    
    @objc func action() {
        let vc = viewController.storyboard!.instantiateViewController(withIdentifier: "EditMemeViewController") as! EditMemeViewController
        vc.modalPresentationStyle = .fullScreen
        viewController.present(vc, animated: true, completion: nil)
    }
}

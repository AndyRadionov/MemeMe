//
//  MemeNavigationController.swift
//  MemeMe
//
//  Created by Andy on 08.05.2020.
//  Copyright © 2020 AndyRadionov. All rights reserved.
//

import UIKit

class MemeNavigationController: UINavigationController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        setupLeftButton(viewController: viewController)
        if !(viewController is DetailMemeViewController) {
            setupRightButton(viewController: viewController)
        }
    }
    
    func setupLeftButton(viewController: UIViewController) {
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title:"Sent Memes", style:.plain, target:nil, action:nil)
    }
    
    func setupRightButton(viewController: UIViewController) {
        viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(openEditMemeScreen)
        )
    }
    
    @objc func openEditMemeScreen() {
        let viewController = topViewController?.storyboard!.instantiateViewController(withIdentifier: "EditMemeViewController") as! EditMemeViewController
        viewController.modalPresentationStyle = .fullScreen
        topViewController?.present(viewController, animated: true, completion: nil)
    }
}

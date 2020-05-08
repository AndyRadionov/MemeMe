//
//  MemeNavigationController.swift
//  MemeMe
//
//  Created by Andy on 08.05.2020.
//  Copyright © 2020 AndyRadionov. All rights reserved.
//

import UIKit

class MemeNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(
        title: "Start Over",
        style: .plain,
        target: self,
        action: #selector(action))
        isNavigationBarHidden = true
    }

    @objc func action() {
        // Function body goes here
    }
}

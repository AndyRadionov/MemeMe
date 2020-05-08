//
//  SentMemesCollectionViewController.swift
//  MemeMe
//
//  Created by Andy on 08.05.2020.
//  Copyright © 2020 AndyRadionov. All rights reserved.
//

import UIKit

class SentMemesCollectionViewController: UIViewController {

    lazy var newMemeNavigationButtonDelegate = NewMemeNavigationButtonDelegate(viewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.delegate = newMemeNavigationButtonDelegate
    }
    

}

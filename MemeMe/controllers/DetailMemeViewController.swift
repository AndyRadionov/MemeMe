//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Andy on 08.05.2020.
//  Copyright © 2020 AndyRadionov. All rights reserved.
//

import UIKit

class DetailMemeViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var meme: Meme!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Sent Memes", style:.plain, target:nil, action:nil)
        imageView.contentMode = .scaleAspectFit
        imageView.image = meme.memedImage
    }
}

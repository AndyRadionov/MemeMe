//
//  SentMemesTableViewController.swift
//  MemeMe
//
//  Created by Andy on 08.05.2020.
//  Copyright © 2020 AndyRadionov. All rights reserved.
//

import UIKit

class SentMemesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    lazy var newMemeNavigationButtonDelegate = NewMemeNavigationButtonDelegate(viewController: self)
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.delegate = newMemeNavigationButtonDelegate
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableCell")!
        let meme = appDelegate.memes[indexPath.row]
        
        cell.imageView?.image = meme.memedImage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "DetailMemeViewController") as! DetailMemeViewController
        detailController.meme = appDelegate.memes[indexPath.row]
        navigationController!.pushViewController(detailController, animated: true)
    }
    

}

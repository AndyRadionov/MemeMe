//
//  MemeViewController+Meme.swift
//  MemeMe-1.0
//
//  Created by Andy on 05.05.2020.
//  Copyright © 2020 AndyRadionov. All rights reserved.
//

import UIKit

extension MemeViewController {
    
    func shareMeme() {
        let memedImage = generateMemedImage()
        
        let controller = UIActivityViewController(activityItems: [memedImage], applicationActivities: nil )
        controller.completionWithItemsHandler = { _, success, _, _ in
            if success { self.save(memedImage) }
        }
        present(controller, animated: true, completion: nil)
    }
    
    private func save(_ memedImage: UIImage) {
        // Create the meme
        let _ = Meme(topText: topTextField.text!, bottomText: bottomTextField.text!, originalImage: imageView.image!, memedImage: memedImage)
    }
}

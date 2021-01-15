//
//  FullScreenPhotoViewController.swift
//  VK
//
//  Created by Karahanyan Levon on 14.01.2021.
//

import UIKit

class FullScreenPhotoViewController: UIViewController {

    var image: UIImage?
    
    @IBOutlet weak var fullScreenPhoto: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fullScreenPhoto?.image = image
        
    }
   
    @IBAction func shareAction(_ sender: Any) {
    }
    
}

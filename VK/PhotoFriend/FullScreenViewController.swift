//
//  FullScreenViewController.swift
//  VK
//
//  Created by Karahanyan Levon on 14.02.2021.
//

import UIKit

class FullScreenViewController: UIViewController {

    var userData = UserFriendsService()
    var user: UserClass?
    var imageNames: [PhotosClass]?
    var currentImageIndex = 0
    
    @IBOutlet weak var friendImage: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        UIImageView.getPhoto(from: imageNames?.first?.urlImage ?? "", imageView: friendImage!)
        
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipe(_:)))
        swipeDownGesture.direction = .down
        view.addGestureRecognizer(swipeDownGesture)
        
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipe(_:)))
        swipeLeftGesture.direction = .left
        view.addGestureRecognizer(swipeLeftGesture)
        
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipe(_:)))
        swipeRightGesture.direction = .right
        view.addGestureRecognizer(swipeRightGesture)
    }
    
    @objc func swipe(_ recognizer: UISwipeGestureRecognizer) {
        if recognizer.direction == .down {
            navigationController?.popViewController(animated: true)
        } else if recognizer.direction == .left {
            
            guard currentImageIndex < imageNames!.count - 1 else { return }
            
            self.currentImageIndex += 1
            
            let image = imageNames?[self.currentImageIndex].urlImage
            
            UIView.animate(withDuration: 0.2) {
                
                self.friendImage?.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                self.friendImage?.layer.opacity = 0
            } completion: { _ in
                self.friendImage?.transform = CGAffineTransform(translationX: self.view.frame.width, y: 0)
                UIImageView.getPhoto(from: image ?? "", imageView: self.friendImage!)
                UIView.animate(withDuration: 0.2) {
                    self.friendImage?.transform = .identity
                    self.friendImage?.layer.opacity = 1
                }
            }
        } else if recognizer.direction == .right {
            
            guard currentImageIndex > 0 else { return }
            
            currentImageIndex -= 1
            
            let image = imageNames?[self.currentImageIndex].urlImage
            
            UIView.animate(withDuration: 0.2) {
                
                self.friendImage?.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                self.friendImage?.layer.opacity = 0
            } completion: { _ in
                self.friendImage?.transform = CGAffineTransform(translationX: -self.view.frame.width, y: 0)
                UIImageView.getPhoto(from: image ?? "", imageView: self.friendImage!)
                UIView.animate(withDuration: 0.2) {
                    self.friendImage?.transform = .identity
                    self.friendImage?.layer.opacity = 1
                }
            }
        }
    }
}

//
//  PhotoFriendController.swift
//  VK
//
//  Created by Karahanyan Levon on 12.01.2021.
//

import UIKit

class PhotoFriendController: UIViewController {

    enum Cells {
        static let identifier = "PhotoFriendCell"
    }
    
    @IBOutlet weak var avatarFriend: UIImageView!
    @IBOutlet weak var nameFriend: UILabel!
    
    var user: User?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.avatarFriend.image = user?.profilPic
        self.nameFriend.text = user?.firstName
    }
}


extension PhotoFriendController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let images = user?.images else { return 0 }
        
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.identifier, for: indexPath) as! PhotoOfFriendCell
        
        cell.imageFriend.image = user?.images[indexPath.item]
        
        return cell
    }
}

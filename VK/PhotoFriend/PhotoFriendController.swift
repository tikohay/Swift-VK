//
//  PhotoFriendController.swift
//  VK
//
//  Created by Karahanyan Levon on 12.01.2021.
//

import UIKit

class PhotoFriendController: UIViewController {

    var photosData = UserFriendsService()
    
    enum Cells {
        static let identifier = "PhotoFriendCell"
    }

    var user: UserClass?
    var photos: [PhotosClass] = []
    
    @IBOutlet weak var photosCollectionView: UICollectionView?
    @IBOutlet var photoFriendContentView: UICollectionView?
    @IBOutlet weak var friendAvatarImage: UIImageView?
    @IBOutlet weak var friendNameLabel: UILabel?
    
    private let itemsPerRow: CGFloat = 2
    private let sectionInserts = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        photosData.getUserPhoto { (photos) in
            self.photos = photos
            self.photosCollectionView?.reloadData()
        }
        
        self.friendNameLabel?.text = user?.firstName
        UIImageView.getPhoto(from: user?.avatarName ?? "", imageView: self.friendAvatarImage!)
        photoFriendContentView?.collectionViewLayout = UICollectionViewFlowLayout()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFullScreenVC" {
            let photoVC = segue.destination as! FullScreenViewController
            photoVC.user = sender as? User
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toFullScreenVC", sender: user)
    }
}

extension PhotoFriendController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.identifier, for: indexPath)
        guard let photoCell = cell as? PhotoOfFriendCell else { return cell }
        
        UIImageView.getPhoto(from: photos[indexPath.item].urlImage, imageView: photoCell.friendImage!)
        
        return photoCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let paddingWidth = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
}



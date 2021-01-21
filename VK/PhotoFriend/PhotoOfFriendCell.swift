//
//  PhotoOfFriendCell.swift
//  VK
//
//  Created by Karahanyan Levon on 12.01.2021.
//

import UIKit

class PhotoOfFriendCell: UICollectionViewCell {
    
    @IBOutlet weak var friendImage: UIImageView?
    @IBOutlet weak var likeButton: UIButton? {
        didSet {
            likeButton?.tintColor = #colorLiteral(red: 0, green: 0.4524545074, blue: 0.9992441535, alpha: 1)
            addDoubleTapForLike()
        }
    }
    
    private var isLike = false
    private var numOfLike = 0
    
    @IBAction func likeButtonClicked(_ sender: UIButton) {
        changeNumOfLikes()
        changeLikeState()
    }
    
    private func changeNumOfLikes() {
        if !isLike {
            likeButton?.setTitle(" \(numOfLike + 1)", for: .normal)
            numOfLike += 1
        } else {
            likeButton?.setTitle(String(numOfLike - 1), for: .normal)
            numOfLike -= 1
        }
        isLike.toggle()
    }
    
    private func changeLikeState() {
        if numOfLike > 0 {
            likeButton?.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            likeButton?.tintColor = .red
            likeButton?.setTitleColor(.red, for: .normal)
            likeButton?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        } else {
            likeButton?.setImage(UIImage(systemName: "heart"), for: .normal)
            likeButton?.tintColor = #colorLiteral(red: 0, green: 0.4524545074, blue: 0.9992441535, alpha: 1)
            likeButton?.setTitle("", for: .normal)
        }
    }
    
    func addDoubleTapForLike() {
        let doubleTapForLike = UITapGestureRecognizer(target: self, action: #selector(tapedForLike))
        doubleTapForLike.numberOfTapsRequired = 2
        friendImage?.addGestureRecognizer(doubleTapForLike)
        friendImage?.isUserInteractionEnabled = true
    }
    
    @objc func tapedForLike() {
        changeNumOfLikes()
        changeLikeState()
    }
}

//
//  friendsCell.swift
//  VK
//
//  Created by Karahanyan Levon on 09.01.2021.
//

import UIKit

class FriendsCell: UITableViewCell {

    @IBOutlet weak var starIcon: UIImageView!
    @IBOutlet weak var imageFriend: UIImageView! {
        didSet {
            imageFriend.layer.cornerRadius = imageFriend.frame.width / 2
        }
    }
    @IBOutlet weak var nameFriend: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func set(user: User) {
        self.nameFriend.text = user.firstName + " " + user.lastName
        self.imageFriend.image = user.image
        
        if (user.isBestFriend) {
            self.starIcon.isHidden = false
        } else {
            self.starIcon.isHidden = true
        }
    }
}

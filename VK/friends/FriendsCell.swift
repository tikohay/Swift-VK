//
//  friendsCell.swift
//  VK
//
//  Created by Karahanyan Levon on 09.01.2021.
//

import UIKit

class FriendsCell: UITableViewCell {

    @IBOutlet weak var starIconImage: UIImageView?
    @IBOutlet weak var friendImage: UIImageView? {
        didSet {
            changeFriendImageView()
        }
    }
    @IBOutlet weak var friendNameLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func changeFriendImageView() {
        guard let friendImage = friendImage else { return }
        friendImage.layer.cornerRadius = friendImage.frame.width / 2
        friendImage.layer.masksToBounds = false
        friendImage.clipsToBounds = true
    }
    
    func set(user: User) {
        self.friendNameLabel?.text = user.firstName + " " + user.lastName
        self.friendImage?.image = UIImage(named: user.avatar)
        
        if (user.isBestFriend) {
            self.starIconImage?.isHidden = false
        } else {
            self.starIconImage?.isHidden = true
        }
    }
}

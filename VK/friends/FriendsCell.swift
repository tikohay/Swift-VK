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
    
    func set(user: User) {
        self.friendNameLabel?.text = user.firstName + " " + user.lastName
        self.friendImage?.image = user.avatar
        
        if (user.isBestFriend) {
            self.starIconImage?.isHidden = false
        } else {
            self.starIconImage?.isHidden = true
        }
    }
    
    func changeFriendImageView() {
        guard let friendImage = friendImage else { return }
        friendImage.layer.cornerRadius = friendImage.frame.width / 2
        friendImage.layer.masksToBounds = false
        friendImage.clipsToBounds = true
        addSubview()
    }
    
    func addSubview() {
        guard let friendImage = friendImage else { return }
        let subViewForImage = UIView(frame: CGRect(x: 0, y: 0, width: friendImage.frame.width, height: friendImage.frame.height))
        subViewForImage.layer.cornerRadius = friendImage.frame.width / 2
        subViewForImage.layer.shadowColor = UIColor.black.cgColor
        subViewForImage.layer.shadowOpacity = 1
        subViewForImage.layer.shadowRadius = 5
        subViewForImage.layer.shadowOffset = CGSize(width: 0, height: 5)
        friendImage.addSubview(subViewForImage)
    }
}

extension UIView {
    
    func setShadowWithCornerRadius(shadowColor: UIColor,
                                   shadowOffSet: CGSize = .zero,
                                   shadowOpacity: Float,
                                   shadowRadis: CGFloat) {
        
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffSet
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadis
    }
}

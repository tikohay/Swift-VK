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
            guard let image = friendImage else { return }
            image.layer.cornerRadius = image.frame.width / 2
        }
    }
    @IBOutlet weak var subViewForImage: UIView! {
        didSet {
            guard let friendImage = friendImage else { return }
            subViewForImage.layer.cornerRadius = friendImage.frame.width / 2
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

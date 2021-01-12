//
//  GroupsCell.swift
//  VK
//
//  Created by Karahanyan Levon on 09.01.2021.
//

import UIKit

class GroupsCell: UITableViewCell {

    
    @IBOutlet weak var imageGroup: UIImageView! {
        didSet {
            imageGroup.layer.cornerRadius = imageGroup.frame.width / 2
        }
    }
    @IBOutlet weak var nameGroup: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(group: Group) {
        self.imageGroup.image = group.image
        self.nameGroup.text = group.name
    }

}

//
//  AvailableGroupsCell.swift
//  VK
//
//  Created by Karahanyan Levon on 09.01.2021.
//

import UIKit

class AvailableGroupsCell: UITableViewCell {

    @IBOutlet weak var availableGroupImage: UIImageView? {
        didSet {
            guard let availableGroupImage1 = availableGroupImage else { return }
            availableGroupImage1.layer.cornerRadius = availableGroupImage1.frame.width / 2
        }
    }
    @IBOutlet weak var availableGroupNameLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func set(availableGroup: Group) {
        self.availableGroupNameLabel?.text = availableGroup.name
        self.availableGroupImage?.image = availableGroup.image
    }

}

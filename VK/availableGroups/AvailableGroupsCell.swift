//
//  AvailableGroupsCell.swift
//  VK
//
//  Created by Karahanyan Levon on 09.01.2021.
//
import Foundation
import UIKit

class AvailableGroupsCell: UITableViewCell {

    
    @IBOutlet weak var availableGroupImage: UIImageView! {
        didSet {
            availableGroupImage.layer.cornerRadius = availableGroupImage.frame.width / 2
        }
    }
    @IBOutlet weak var abailableGroupName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(availableGroup: Group) {
        self.abailableGroupName.text = availableGroup.name
        self.availableGroupImage.image = availableGroup.image
    }

}

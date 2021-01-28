//
//  TestView.swift
//  VK
//
//  Created by Karahanyan Levon on 23.01.2021.
//

import UIKit
 
class ViewForImage: UIView {
    
    @IBInspectable var shadowColor = UIColor.black
    @IBInspectable var shadowRadius = 4
    @IBInspectable var shadowOpacity = 0.4
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        changeViewForImage()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        changeViewForImage()
    }
    
    func changeViewForImage() {
        layer.cornerRadius = frame.width / 2
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = Float(shadowOpacity)
        layer.shadowRadius = CGFloat(shadowRadius)
        layer.shadowOffset = CGSize.zero
    }
}

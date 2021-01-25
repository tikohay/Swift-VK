//
//  TestView.swift
//  VK
//
//  Created by Karahanyan Levon on 23.01.2021.
//

import UIKit
 
class ViewForImage: UIView {
    
    @IBInspectable var shadowColor = UIColor.black {
        didSet {
            changeViewForImage()
        }
    }
    @IBInspectable var shadowRadius = 4 {
        didSet {
            changeViewForImage()
        }
    }
    @IBInspectable var shadowOpacity = 0.4 {
        didSet {
            changeViewForImage()
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        changeViewForImage()
    }
    
    func changeViewForImage() {
        layer.cornerRadius = frame.width
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = Float(shadowOpacity)
        layer.shadowRadius = CGFloat(shadowRadius)
        layer.shadowOffset = CGSize.zero
    }
}

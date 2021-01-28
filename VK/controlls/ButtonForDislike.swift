//
//  ButtonForDislike.swift
//  VK
//
//  Created by Karahanyan Levon on 26.01.2021.
//

import UIKit

class ButtonForDislike: UIControl {
    
    var countOfDislikeLabel = UILabel()
    var stackView = UIStackView()
    var dislikeButton: UIButton? {
        setButton()
    }
    
    private let handThumbsdownImage = UIImage(systemName: "hand.thumbsdown")
    private let handThumbsupFillImage = UIImage(systemName: "hand.thumbsdown.fill")
    private var isDislike = false
    private var countOfDislike = 0
    
    func setButton() -> UIButton {
        var button = UIButton(type: .system)
        
        button = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        
        if let image = handThumbsdownImage {
            button.setImage(image, for: .normal)
        }
        
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(10))
        button.tintColor = #colorLiteral(red: 0, green: 0.4524545074, blue: 0.9992441535, alpha: 1)
        button.addTarget(self, action: #selector(tappedDislike), for: .touchUpInside)
        self.addSubview(button)
        return button
    }
    
    func addStackView() {
        guard let dislikeButton = dislikeButton else { return }
        
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 0
        stackView.addArrangedSubview(dislikeButton)
        stackView.addArrangedSubview(countOfDislikeLabel)
    }
    
    func setCountOfDislikeLabel() {
        countOfDislikeLabel.font = countOfDislikeLabel.font.withSize(15)
        countOfDislikeLabel.textColor = #colorLiteral(red: 0, green: 0.4524545074, blue: 0.9992441535, alpha: 1)
    }
    
    @objc func tappedDislike(_ sender: UIButton) {
        isDislike.toggle()
        if isDislike {
            sender.setImage(handThumbsupFillImage, for: .normal)
            countOfDislikeLabel.text = "\(countOfDislike + 1)"
            countOfDislike += 1
        } else {
            sender.setImage(handThumbsdownImage, for: .normal)
            countOfDislikeLabel.text = ""
            countOfDislike -= 1
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addStackView()
        setCountOfDislikeLabel()
        self.addSubview(stackView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addStackView()
        setCountOfDislikeLabel()
        self.addSubview(stackView)
    }
}

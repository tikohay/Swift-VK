//
//  NewsTableViewCell.swift
//  VK
//
//  Created by Karahanyan Levon on 04.02.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    var commentText: String?
    var isLike = false
    var likeCount = 0
    
    @IBOutlet weak var newsTextScrollView: UIScrollView?
    @IBOutlet weak var newsLogoImage: UIImageView? {
        didSet {
            guard let imageWidth = newsLogoImage?.frame.width else { return }
            newsLogoImage?.layer.cornerRadius = imageWidth / 2
        }
    }
    @IBOutlet weak var newsNameLabel: UILabel?
    @IBOutlet weak var newsImage: UIImageView?
    @IBOutlet weak var newsTextLabel: UILabel?
    @IBOutlet weak var commentsLabel: UILabel?
    @IBOutlet weak var likeButton: UIButton?
    @IBOutlet weak var commentButton: UIButton?
    
    @IBAction func likeTapped(_ sender: UIButton) {
        if !isLike {
            likeCount += 1
            likeButton?.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            likeButton?.tintColor = .red
            likeButton?.setTitleColor(.red, for: .normal)
            likeButton?.setTitle(" \(likeCount)", for: .normal)
        } else {
            likeButton?.setImage(UIImage(systemName: "heart"), for: .normal)
            likeButton?.tintColor = #colorLiteral(red: 0.0138685042, green: 0.4820565581, blue: 0.9983528256, alpha: 1)
            likeButton?.setTitle("", for: .normal)
            likeCount -= 1
        }
        isLike.toggle()
    }
    
    @IBAction func commentTapped(_ sender: UIButton) {
        
    }
    
    func set(news: NewsItem) {
        
        newsImage?.image = UIImage(named: news.newsImageName!)
        newsLogoImage?.image = UIImage(named: news.newsLogoName!)
        newsNameLabel?.text = news.newsName
        newsTextLabel?.text = news.newsText
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commentsLabel?.text = commentText
        newsTextScrollView?.showsVerticalScrollIndicator = false
    }
}

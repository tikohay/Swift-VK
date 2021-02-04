//
//  NewsViewController.swift
//  VK
//
//  Created by Karahanyan Levon on 03.02.2021.
//

import UIKit

class NewsViewController: UIViewController {

    var commentLabel: String?
    
    @IBOutlet weak var newsTableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTableView?.dataSource = self
        newsTableView?.delegate = self
        
        newsTableView?.register(UINib(nibName: "NewsCustomCellXib", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    @IBAction func returnToNewsController(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func returnAndLeaveCommentToNewsController(segue: UIStoryboardSegue) {
        guard segue.identifier == "leaveComment" else { return }
        let commentController = segue.source as? CommentsViewController
        let commentText = commentController?.commentText?.text
        commentLabel = commentText
        newsTableView?.reloadData()
    }
}

extension NewsViewController: UITableViewDelegate {
    
}

extension NewsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        guard let newsCell = cell as? NewsTableViewCell else { return cell}
        
        let availableNews = news[indexPath.row]
        
        newsCell.set(news: availableNews)
        newsCell.commentButton?.addTarget(self, action: #selector(tapCommentButton), for: .touchUpInside)
        newsCell.commentsLabel?.text = commentLabel
        
        return cell
    }
    
    @objc func tapCommentButton() {
        performSegue(withIdentifier: "toCommentsView", sender: nil)
    }
}

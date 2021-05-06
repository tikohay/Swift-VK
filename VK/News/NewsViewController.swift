//
//  NewsViewController.swift
//  VK
//
//  Created by Karahanyan Levon on 03.02.2021.
//

import UIKit

class NewsViewController: UIViewController {

    var commentLabel: String?
    
    var news: NewsResponseInfo?
    
    var userData = UserFriendsService()
    
    @IBOutlet weak var newsTableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTableView?.dataSource = self
        newsTableView?.delegate = self
        
        newsTableView?.register(UINib(nibName: "NewsCustomCellXib", bundle: nil), forCellReuseIdentifier: "Cell")
        
        self.userData.getNews { news in
            DispatchQueue.main.async {
                self.news = news
                self.newsTableView?.reloadData()
            }
        }
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
        return news?.groups.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        guard let newsCell = cell as? NewsTableViewCell else { return cell }
        
        guard
            let newsMain = news?.groups[indexPath.row],
            let newsFill = news?.items[indexPath.row]
        else { return cell}
        
        newsCell.set(newsMain: newsMain, newsFill: newsFill)
        newsCell.commentButton?.addTarget(self, action: #selector(tapCommentButton), for: .touchUpInside)
        newsCell.commentsLabel?.text = commentLabel
        
        return cell
    }
    
    @objc func tapCommentButton() {
        performSegue(withIdentifier: "toCommentsView", sender: nil)
    }
}

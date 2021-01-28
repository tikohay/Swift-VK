//
//  FriendViewController.swift
//  VK
//
//  Created by Karahanyan Levon on 22.01.2021.
//

import UIKit

class FriendViewController: UIViewController {
    
    @IBOutlet weak var friendsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsTableView.showsVerticalScrollIndicator = false
    }
}

extension FriendViewController: UITableViewDelegate {
    
}

extension FriendViewController: UITableViewDataSource {
    
    enum Segues {
        static let toPhoto = "ToPhotoController"
    }

    enum Cells {
        static let friend = "friendsCell"
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.friend, for: indexPath)
        guard let friendCell = cell as? FriendsCell else { return cell }

        let user = users[indexPath.row]

        friendCell.set(user: user)

        return friendCell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.toPhoto {
            guard let destVC = segue.destination as? PhotoFriendController else { return }
            destVC.user = sender as? User
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        performSegue(withIdentifier: Segues.toPhoto, sender: user)
    }

    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let favoriteFriend = myFavoriteFriend(at: indexPath)
        return UISwipeActionsConfiguration(actions: [favoriteFriend])
    }

    func myFavoriteFriend(at indexPath: IndexPath) -> UIContextualAction {

        var user = users[indexPath.row]

        let action = UIContextualAction(style: .normal, title: "best friend") { (action, view, completion) in

            user.isBestFriend.toggle()

            users.remove(at: indexPath.row)

            if user.isBestFriend {
                users.insert(user, at: 0)
            } else {
                users.append(user)
            }
            self.friendsTableView.reloadData()
            completion(true)
        }

        if user.isBestFriend {
            action.image = UIImage(systemName: "star.slash")
            action.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        } else {
            action.image = UIImage(systemName: "star")
            action.backgroundColor = #colorLiteral(red: 0, green: 0.4524545074, blue: 0.9992441535, alpha: 1)
        }
        return action
    }
}

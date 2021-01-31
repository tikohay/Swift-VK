//
//  FriendViewController.swift
//  VK
//
//  Created by Karahanyan Levon on 22.01.2021.
//

import UIKit

class FriendViewController: UIViewController {
    
    var usersDict: [Character: [User]] = [:]
    
    @IBOutlet weak var friendsTableView: UITableView!
    @IBOutlet weak var sectionIndexTitlesView: SectionIndexTitlesControll!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsTableView.showsVerticalScrollIndicator = false
        
        sectionIndexTitlesView.addTarget(self, action: #selector(sectionLetterChanged), for: .valueChanged)
        
        createUsersDict()
    }
    
    @objc func sectionLetterChanged() {
        
        guard let letter = sectionIndexTitlesView.selectedLetter else { return }
        guard let letterIndex = usersFirstLetters.firstIndex(of: letter) else { return }
        
        friendsTableView.scrollToRow(at: IndexPath(row: 0, section: letterIndex), at: .top, animated: true)
        
    }
    
    private func createUsersDict() {
        for user in users {
            guard let firstLetter = user.firstName.first else { continue }
            
            if var userValues = usersDict[firstLetter] {
                userValues.append(user)
                usersDict[firstLetter] = userValues
            } else {
                usersDict[firstLetter] = [user]
            }
        }
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
        return usersFirstLetters.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let letter = usersFirstLetters[section]
        
        return usersDict[letter]?.count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(usersFirstLetters[section])
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.friend, for: indexPath)
        guard let friendCell = cell as? FriendsCell else { return cell }
        
        let user = getUserFromDict(indexPath)

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
        let user = getUserFromDict(indexPath)
        performSegue(withIdentifier: Segues.toPhoto, sender: user)
    }

    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let bestFriendAction = getMyBestFriendAction(at: indexPath)
        
        return UISwipeActionsConfiguration(actions: [bestFriendAction])
    }

    func getMyBestFriendAction(at indexPath: IndexPath) -> UIContextualAction {

        var user = getUserFromDict(indexPath)
        let letter = usersFirstLetters[indexPath[0]]
        
        guard var usersArray = usersDict[letter] else { return UIContextualAction() }
        
        let action = UIContextualAction(style: .normal, title: "best friend") { (action, view, completion) in

            user.isBestFriend.toggle()

            usersArray.remove(at: indexPath.row)

            if user.isBestFriend {
                usersArray.insert(user, at: 0)
            } else {
                usersArray.append(user)
            }
            self.usersDict[letter] = usersArray
            
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
    
    private func getUserFromDict(_ indexPath: IndexPath) -> User {
        let letter = usersFirstLetters[indexPath[0]]
        let usersArray = usersDict[letter]
        let user = usersArray![indexPath[1]]
        
        return user
    }
}

//
//  FriendsController.swift
//  VK
//
//  Created by Karahanyan Levon on 09.01.2021.
//

import UIKit


class FriendsController: UITableViewController {

    @IBAction func back(segue: UIStoryboardSegue) {

    }

    enum Segues {
        static let toPhoto = "ToPhotoController"
    }

    enum Cells {
        static let friend = "friendsCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        performSegue(withIdentifier: Segues.toPhoto, sender: user)
    }

    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
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
            self.tableView.reloadData()
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//}
}


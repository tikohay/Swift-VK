//
//  GroupsViewController.swift
//  VK
//
//  Created by Karahanyan Levon on 09.01.2021.
//

import UIKit

class GroupsController: UITableViewController {
    
    enum Cells {
        static let group = "groupsCell"
    }
    
    var groups: [Group] = []
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {
            guard let availableGroupsController = segue.source as? AvailableGroups else { return }
            
            if let indexPath = availableGroupsController.tableView.indexPathForSelectedRow {
                let group = availableGroupsController.availableGroups[indexPath.row]
                
                if !groups.contains(where: {$0.name == group.name && $0.image == group.image}) {
                    groups.append(group)
                    tableView.reloadData()
                }
            }
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.group, for: indexPath) as! GroupsCell
        let group = groups[indexPath.row]
        
        cell.set(group: group)
        
        return cell
    }
 
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

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

}

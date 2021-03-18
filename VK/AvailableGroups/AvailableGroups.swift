//
//  AvailableGroupsController.swift
//  VK
//
//  Created by Karahanyan Levon on 09.01.2021.
//

import UIKit
import RealmSwift

class AvailableGroups: UITableViewController {
    
    enum Cells {
        static let availableGroup = "availableGroupCell"
    }
    
    var selectedGroup: AvailableGroupsClass?
    var userData = UserFriendsService()
    var availableGroups: [AvailableGroupsClass] = [] {
        didSet {
            convertedGroup = availableGroups.map { GroupClass(value: $0) }
        }
    }
    var convertedGroup: [GroupClass]?
    
    @IBOutlet var availableGroupsTableView: UITableView?
    @IBOutlet weak var availableGroupSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeSearchBarState()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        gesture.cancelsTouchesInView = false
        view.addGestureRecognizer(gesture)
    }
    
    func changeSearchBarState() {
        availableGroupSearchBar.placeholder = "Search:"
        tableView.tableHeaderView = availableGroupSearchBar
    }
    
    func loadData() {
        do {
            let realm = try Realm()
            let availableGroups = realm.objects(AvailableGroupsClass.self)
            self.availableGroups = Array(availableGroups)
        } catch {
            print(error)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedGroup = availableGroups[indexPath.row]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return availableGroups.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.availableGroup, for: indexPath)
        guard let availableGroupCell = cell  as? AvailableGroupsCell else { return cell }

        let group = availableGroups[indexPath.row]

        availableGroupCell.set(availableGroup: group)

        return availableGroupCell
    }
    
    @objc func endEditing() {
        view.endEditing(true)
    }
}

extension AvailableGroups: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        availableGroups = []
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            availableGroups = []
            tableView.reloadData()
        } else {
            userData.getUserSearchGroups(group: searchText) { () in
                self.loadData()
                self.tableView.reloadData()
            }
        }
    }
}

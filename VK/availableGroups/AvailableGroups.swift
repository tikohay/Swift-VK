//
//  AvailableGroupsController.swift
//  VK
//
//  Created by Karahanyan Levon on 09.01.2021.
//

import UIKit



class AvailableGroups: UITableViewController {

    enum Cells {
        static let availableGroup = "availableGroupCell"
    }
    
    @IBOutlet weak var availableGroupSearchBar: UISearchBar!
    
    let availableGroups = [
        Group(name: "Институт Благородных Девиц", image: UIImage(named: "ибд")!),
        Group(name: "the Question", image: UIImage(named: "question")!),
        Group(name: "Swift Book", image: UIImage(named: "swiftLogo")!)
    ]

    var availableGroupDuplicate: [Group] = []
    
    func changeSearchBarState() {
        availableGroupSearchBar.placeholder = "Search:"
        tableView.tableHeaderView = availableGroupSearchBar
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        availableGroupDuplicate = availableGroups
        
        changeSearchBarState()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return availableGroupDuplicate.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.availableGroup, for: indexPath)
        guard let availableGroupCell = cell  as? AvailableGroupsCell else { return cell }

        let group = availableGroupDuplicate[indexPath.row]

        availableGroupCell.set(availableGroup: group)

        return availableGroupCell
    }
}

extension AvailableGroups: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        availableGroupDuplicate = availableGroups
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        availableGroupDuplicate = searchText.isEmpty ? availableGroups : availableGroups.filter({ (group) -> Bool in
            return group.name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        })
        tableView.reloadData()
    }
}

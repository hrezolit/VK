//
//  MyGroupsTableViewController.swift
//  VKapp1
//
//  Created by Nikita on 23/3/22.
//

import UIKit

class MyGroupsTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var groupsForMyTableView = [Group]()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        editButtonItem.tintColor = UIColor(named: "acidGreen")
        searchBar.delegate = self
        
        groupsForMyTableView = subscribedGroups
    }
    
    // MARK: - Table view data source
    
    // set the height of cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // the number of sections equals count of array items
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsForMyTableView.count
    }
    
    // cell data filling
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupsCell", for: indexPath) as? SubscribedGroupsViewCell
        let subscribedGroups = groupsForMyTableView[indexPath.row]
        
        cell?.subscribedGroupName.text = subscribedGroups.groupName
        cell?.subscribedGroupPicture.image = UIImage(named: subscribedGroups.groupPicture)
        
        return cell ?? UITableViewCell()
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // moving objects in row
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        groupsForMyTableView.swapAt(sourceIndexPath.item, destinationIndexPath.item)
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            tableView.beginUpdates()
            
            // Delete in subscribedGroups and move item in unSubscribedGroups
            let removedItem = groupsForMyTableView.remove(at: indexPath.row)
            unSubscribedGroups.append(removedItem)
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            tableView.endUpdates()
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    //MARK: - prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectedGroup" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedGroupVC = segue.destination as? SelectedGroupViewController
                let subscribedGroup = subscribedGroups[indexPath.row]
                selectedGroupVC?.groupTitle = subscribedGroup.groupName
            }
        } else if segue.identifier == "newGroups" {
            if let newGroupsVC = segue.destination as? NewGroupsTableViewController {
                newGroupsVC.delegate = self
            }
        }
    }
}

//MARK: - extensions
extension MyGroupsTableViewController: NewGroupsTableViewControllerDelegate {
    func userSubscribed(group: [Group]) {
        tableView.reloadData()
    }
}

extension MyGroupsTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            groupsForMyTableView = subscribedGroups
            tableView.reloadData()
            return
        }
        groupsForMyTableView = subscribedGroups.filter { $0.groupName.lowercased().contains(searchText.lowercased()) }
            
        tableView.reloadData()
        }
}


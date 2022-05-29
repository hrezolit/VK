//
//  FrinedsTableViewController.swift
//  VKapp1
//
//  Created by Nikita on 23/3/22.
//

import UIKit

struct SortingFriendsForHeader {
    var firstLetter: Character
    var friends: [User]
}

class FrinedsTableViewController: UITableViewController {
    
    let networkManager = NetworkManager()
    
    var friendFirstLetter: [SortingFriendsForHeader] {
        var result = [SortingFriendsForHeader]()
        
        for friend in allFriends {
            guard let character = friend.name.first else { continue }
            
            if let index = result.firstIndex(where: { $0.firstLetter == character } ) {
                result[index].friends.append(friend)
                
            } else {
                
                let sortedFriend = SortingFriendsForHeader(firstLetter: character, friends: [friend])
                result.append(sortedFriend)
            }
        }
        return result
    }
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.fetchFriendsData()
        
        let myNib = UINib(nibName: "FriendsAlphabetHeaderView", bundle: .main)
        tableView.register(myNib, forHeaderFooterViewReuseIdentifier: "header")
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return friendFirstLetter.count
    }
    // the number of sections equals count of array items
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let friend = friendFirstLetter[section]
        return friend.friends.count
    }
    
    // customized header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? FriendsAlphabetHeaderView
        let friend = friendFirstLetter[section]
        view?.letterLabel.text = String(friend.firstLetter)
        
        return view
    }
    
    
    // cell data filling
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as? FriendViewCell
        
        let friend = friendFirstLetter[indexPath.section]
        let friendSection = friend.friends[indexPath.row]
        
        cell?.userPicture.image = UIImage(named: friendSection.userPicture)
        cell?.userName.text = friendSection.name
      
        return cell ?? UITableViewCell()
    }
    
    // set the height of cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    // MARK: - Navigation
    
    // preparation for use selected cell picture -> sending in next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? FriendViewCell,
              let indexPath = tableView.indexPath(for: cell),
              let photoViewController = segue.destination as? PhotosCollectionViewController else { return }
        
        let friend = friendFirstLetter[indexPath.section]
        let friendSection = friend.friends[indexPath.row]
        
        photoViewController.friendIndex = allFriends.firstIndex(where: { $0.name == friendSection.name }) ?? 0
        photoViewController.title = friendSection.name
        
    }
}

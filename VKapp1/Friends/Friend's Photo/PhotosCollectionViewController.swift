//
//  PhotosCollectionViewController.swift
//  VKapp1
//
//  Created by Nikita on 23/3/22.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    var friendIndex: Int = 0
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allFriends[friendIndex].userPhotos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCell", for: indexPath) as? PhotoCollectionViewCell
        let photo = allFriends[friendIndex].userPhotos[indexPath.row]
        
        cell?.friendPhotos.image = UIImage(named: photo.image)
        cell?.likeControl.isSelected = photo.isLiked
        cell?.markedAsLiked = { isSelected in
            allFriends[self.friendIndex].userPhotos[indexPath.row].isLiked = isSelected
        }
        return cell ?? UICollectionViewCell()
    }
    
    //MARK: - prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let swipeViewController = segue.destination as? PhotoSwipeViewController {
            swipeViewController.photos = allFriends[friendIndex].userPhotos
            navigationController?.navigationBar.tintColor = .clear
            navigationController?.navigationItem.titleView?.backgroundColor = .clear
            
        }
    }
    //MARK: - unwindSegue
    @IBAction func unwindSegue(_ unwindSegue: UIStoryboardSegue) {
        if let photoCollectionView = unwindSegue.destination as? PhotosCollectionViewController {
            photoCollectionView.navigationController?.isNavigationBarHidden = false
            photoCollectionView.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0, green: 0.4802438617, blue: 0.9985234141, alpha: 1)
            photoCollectionView.navigationController?.navigationItem.titleView?.backgroundColor = #colorLiteral(red: 0, green: 0.4802438617, blue: 0.9985234141, alpha: 1)
        }
    }
    
}

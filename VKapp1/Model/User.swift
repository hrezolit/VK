//
//  User.swift
//  VKapp1
//
//  Created by Nikita on 25/3/22.
//

import Foundation
import UIKit

struct User1: Decodable {
    let response: ResponseFriends

	enum CodingKeys: String, CodingKey {
		case response = "response"
	}
}

struct ResponseFriends: Decodable {
    let count: Int
    let items: [Item1]

	enum CodingKeys: String, CodingKey {
		case count = "count"
		case items = "items"
	}
}

struct Item1: Decodable {
    let id: Int
    let birthday: String?
    let trackCode: String
    let firstName: String
    let lastName: String
	let photo100: String
    let canAccessClosed: Bool?
    let isClosed: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case birthday = "bdate"
        case trackCode = "track_code"
        case firstName = "first_name"
        case lastName = "last_name"
		case photo100 = "photo_100"
        case canAccessClosed = "can_access_closed"
        case isClosed = "is_closed"
    }
}




//MARK: - old code
struct User {
    
    let name: String
    let userPicture: String
    var userPhotos: [Photo]
}

struct Photo {
    var image: String
    var isLiked: Bool
}

var allFriends: [User] = [
    
    User(name: "Benedict Cumberbatch",
         userPicture: "Benedict Cumberbatch",
         userPhotos: [
            Photo(image: "Benedict Cumberbatch1", isLiked: false),
            Photo(image: "Benedict Cumberbatch2", isLiked: false),
            Photo(image: "Benedict Cumberbatch3", isLiked: false),
            Photo(image: "Benedict Cumberbatch4", isLiked: false),
            Photo(image: "Benedict Cumberbatch5", isLiked: false),
            Photo(image: "Benedict Cumberbatch6", isLiked: false),
            Photo(image: "Benedict Cumberbatch7", isLiked: false)
         ]),
    
    User(name: "Jack Bro",
         userPicture: "Jack Bro",
         userPhotos: [
            Photo(image: "Jack Bro1", isLiked: false),
            Photo(image: "Jack Bro2", isLiked: false),
            Photo(image: "Jack Bro3", isLiked: false),
            Photo(image: "Jack Bro4", isLiked: false),
            Photo(image: "Jack Bro5", isLiked: false),
            Photo(image: "Jack Bro6", isLiked: false)
         ]),
    
    User(name: "Jimmy Johnnes",
         userPicture: "Jimmy Johnnes",
         userPhotos: [
            Photo(image: "Jimmy Johnnes1", isLiked: false),
            Photo(image: "Jimmy Johnnes2", isLiked: false),
            Photo(image: "Jimmy Johnnes3", isLiked: false),
            Photo(image: "Jimmy Johnnes4", isLiked: false),
            Photo(image: "Jimmy Johnnes5", isLiked: false),
            Photo(image: "Jimmy Johnnes6", isLiked: false)
         ]),
    
    User(name: "Karen Gillan",
         userPicture: "Karen Gillan",
         userPhotos: [
            Photo(image: "Karen Gillan1", isLiked: false),
            Photo(image: "Karen Gillan2", isLiked: false),
            Photo(image: "Karen Gillan3", isLiked: false),
            Photo(image: "Karen Gillan4", isLiked: false),
            Photo(image: "Karen Gillan5", isLiked: false),
            Photo(image: "Karen Gillan6", isLiked: false),
            Photo(image: "Karen Gillan7", isLiked: false),
            Photo(image: "Karen Gillan8", isLiked: false)
         ]),
    
    User(name: "Kristofer Hivju",
         userPicture: "Kristofer Hivju",
         userPhotos: [
            Photo(image: "Kristofer Hivju1", isLiked: false),
            Photo(image: "Kristofer Hivju2", isLiked: false),
            Photo(image: "Kristofer Hivju3", isLiked: false),
            Photo(image: "Kristofer Hivju4", isLiked: false),
            Photo(image: "Kristofer Hivju5", isLiked: false),
            Photo(image: "Kristofer Hivju6", isLiked: false),
            Photo(image: "Kristofer Hivju7", isLiked: false),
            Photo(image: "Kristofer Hivju8", isLiked: false),
            Photo(image: "Kristofer Hivju9", isLiked: false)
         ]),
    
    User(name: "Mike Myers",
         userPicture: "Mike Myers",
         userPhotos: [
            Photo(image: "Mike Myers1", isLiked: false),
            Photo(image: "Mike Myers2", isLiked: false),
            Photo(image: "Mike Myers3", isLiked: false),
            Photo(image: "Mike Myers4", isLiked: false),
            Photo(image: "Mike Myers5", isLiked: false),
            Photo(image: "Mike Myers6", isLiked: false),
            Photo(image: "Mike Myers7", isLiked: false),
            Photo(image: "Mike Myers8", isLiked: false),
            Photo(image: "Mike Myers9", isLiked: false)
         ]),
    
    User(name: "Nathan Gamble",
         userPicture: "Nathan Gamble",
         userPhotos: [
            Photo(image: "Nathan Gamble1", isLiked: false),
            Photo(image: "Nathan Gamble2", isLiked: false),
            Photo(image: "Nathan Gamble3", isLiked: false),
            Photo(image: "Nathan Gamble4", isLiked: false),
            Photo(image: "Nathan Gamble5", isLiked: false),
            Photo(image: "Nathan Gamble6", isLiked: false),
            Photo(image: "Nathan Gamble7", isLiked: false),
            Photo(image: "Nathan Gamble8", isLiked: false)
         ]),
    
    User(name: "Nicole Kidman",
         userPicture: "Nicole Kidman",
         userPhotos: [
            Photo(image: "Nicole Kidman1", isLiked: false),
            Photo(image: "Nicole Kidman2", isLiked: false),
            Photo(image: "Nicole Kidman3", isLiked: false),
            Photo(image: "Nicole Kidman4", isLiked: false),
            Photo(image: "Nicole Kidman5", isLiked: false),
            Photo(image: "Nicole Kidman6", isLiked: false),
            Photo(image: "Nicole Kidman7", isLiked: false)
         ]),
    
    User(name: "Rose Leslie",
         userPicture: "Rose Leslie",
         userPhotos: [
            Photo(image: "Rose Leslie1", isLiked: false),
            Photo(image: "Rose Leslie2", isLiked: false),
            Photo(image: "Rose Leslie3", isLiked: false),
            Photo(image: "Rose Leslie4", isLiked: false),
            Photo(image: "Rose Leslie5", isLiked: false),
            Photo(image: "Rose Leslie6", isLiked: false),
            Photo(image: "Rose Leslie7", isLiked: false)
         ]),
    
    User(name: "Rupert Grint",
         userPicture: "Rupert Grint",
         userPhotos: [
            Photo(image: "Rupert Grint1", isLiked: false),
            Photo(image: "Rupert Grint2", isLiked: false),
            Photo(image: "Rupert Grint3", isLiked: false),
            Photo(image: "Rupert Grint4", isLiked: false),
            Photo(image: "Rupert Grint5", isLiked: false),
            Photo(image: "Rupert Grint6", isLiked: false),
            Photo(image: "Rupert Grint7", isLiked: false)
         ])
    
]

//struct User {
//
//    let name: String
//    let userPicture: String
//    let userPhoto: [String]
//
//    static var allFriends: [User] = [
//
//        User(name: "Benedict Cumberbatch", userPicture: "Benedict Cumberbatch", userPhoto: ["Benedict Cumberbatch1", "Benedict Cumberbatch2", "Benedict Cumberbatch3", "Benedict Cumberbatch4", "Benedict Cumberbatch5", "Benedict Cumberbatch6", "Benedict Cumberbatch7"]),
//        User(name: "Jack Bro", userPicture: "Jack Bro", userPhoto: ["Jack Bro1", "Jack Bro2", "Jack Bro3", "Jack Bro4", "Jack Bro5", "Jack Bro6"]),
//        User(name: "Jimmy Johnnes", userPicture: "Jimmy Johnnes", userPhoto: ["Jimmy Johnnes1", "Jimmy Johnnes2", "Jimmy Johnnes3", "Jimmy Johnnes4", "Jimmy Johnnes5", "Jimmy Johnnes6"]),
//        User(name: "Karen Gillan", userPicture: "Karen Gillan", userPhoto: ["Karen Gillan1", "Karen Gillan2", "Karen Gillan3", "Karen Gillan4", "Karen Gillan5", "Karen Gillan6", "Karen Gillan7", "Karen Gillan8"]),
//        User(name: "Kristofer Hivju", userPicture: "Kristofer Hivju", userPhoto: ["Kristofer Hivju1", "Kristofer Hivju2", "Kristofer Hivju3", "Kristofer Hivju4", "Kristofer Hivju5", "Kristofer Hivju6", "Kristofer Hivju7", "Kristofer Hivju8", "Kristofer Hivju9"]),
//        User(name: "Mike Myers", userPicture: "Mike Myers", userPhoto: ["Mike Myers1", "Mike Myers2", "Mike Myers3", "Mike Myers4", "Mike Myers5", "Mike Myers6", "Mike Myers7", "Mike Myers8", "Mike Myers9"]),
//        User(name: "Nathan Gamble", userPicture: "Nathan Gamble", userPhoto: ["Nathan Gamble1", "Nathan Gamble2", "Nathan Gamble3", "Nathan Gamble4", "Nathan Gamble5", "Nathan Gamble6", "Nathan Gamble7", "Nathan Gamble8"]),
//        User(name: "Nicole Kidman", userPicture: "Nicole Kidman", userPhoto: ["Nicole Kidman1", "Nicole Kidman2", "Nicole Kidman3", "Nicole Kidman4", "Nicole Kidman5", "Nicole Kidman6", "Nicole Kidman7"]),
//        User(name: "Rose Leslie", userPicture: "Rose Leslie", userPhoto: ["Rose Leslie1", "Rose Leslie2", "Rose Leslie3", "Rose Leslie4", "Rose Leslie5", "Rose Leslie6", "Rose Leslie7"]),
//        User(name: "Rupert Grint", userPicture: "Rupert Grint", userPhoto: ["Rupert Grint1", "Rupert Grint2", "Rupert Grint3", "Rupert Grint4", "Rupert Grint5", "Rupert Grint6", "Rupert Grint7"])
//
//    ]
//}

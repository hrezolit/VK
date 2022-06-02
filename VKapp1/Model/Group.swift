//
//  Group.swift
//  VKapp1
//
//  Created by Nikita on 25/3/22.
//

import Foundation

struct GroupsVK: Codable {
    let response: Response3
}

struct Response3: Codable {
    let count: Int
    let items: [Item3]
}

struct Item3: Codable {
    let id: Int
    let name: String
    let screenName: String
    let isClosed: Int
    let type: TypeEnum
    let isAdmin: Int
    let adminLevel: Int?
    let isMember: Int
    let isAdvertiser: Int
    let photo50: String
    let photo100: String
    let photo200: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case screenName = "screen_name"
        case isClosed = "is_closed"
        case type
        case isAdmin = "is_admin"
        case adminLevel = "admin_level"
        case isMember = "is_member"
        case isAdvertiser = "is_advertiser"
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case photo200 = "photo_200"
    }
}

enum TypeEnum: String, Codable {
    case group = "group"
    case page = "page"
}


//MARK: - old code
struct Group {
    
    let id: String
    let groupName: String
    let groupPicture: String
}

var subscribedGroups: [Group] = [
    Group(id: "1", groupName: "Apple News", groupPicture: "Apple News"),
    Group(id: "2", groupName: "Dungeon and Dragons", groupPicture: "Dungeon and Dragons"),
    Group(id: "3", groupName: "English lessons", groupPicture: "English lessons"),
    Group(id: "4", groupName: "Epic Games Group", groupPicture: "Epic Games Group"),
    Group(id: "5", groupName: "Free Muzik", groupPicture: "Free Muzik"),
    Group(id: "6", groupName: "Geek Brains", groupPicture: "Geek Brains"),
    Group(id: "7", groupName: "GitHub or nothing", groupPicture: "GitHub or nothing"),
    Group(id: "8", groupName: "HarryPotterMans", groupPicture: "HarryPotterMans"),
    Group(id: "9", groupName: "How to AppStore", groupPicture: "How to AppStore"),
    Group(id: "10", groupName: "Meme", groupPicture: "Meme"),
    Group(id: "11", groupName: "TheSwiftDevelopers", groupPicture: "TheSwiftDevelopers")
]

var unSubscribedGroups: [Group] = [
    Group(id: "1", groupName: "Motivation Group", groupPicture: "Motivation Group"),
    Group(id: "2", groupName: "reddit", groupPicture: "reddit"),
    Group(id: "3", groupName: "RoboTech Group", groupPicture: "RoboTech Group"),
    Group(id: "4", groupName: "Stack Overflow", groupPicture: "Stack Overflow"),
    Group(id: "5", groupName: "Stocks", groupPicture: "Stocks"),
    Group(id: "6", groupName: "Swift or How to Diy", groupPicture: "Swift or How to Diy"),
]

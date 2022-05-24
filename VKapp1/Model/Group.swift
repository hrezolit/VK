//
//  Group.swift
//  VKapp1
//
//  Created by Nikita on 25/3/22.
//

import Foundation

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

//
//  Photos.swift
//  VKapp1
//
//  Created by Nikita on 31/5/22.
//

import Foundation

struct Photos1: Codable {
    let response: Response
}

struct Response: Codable {
    let count: Int
    let items: [Item]
}

struct Item: Codable {
    let albumID: Int
    let date: Int
    let id: Int
    let ownerID: Int
    let postID: Int
    let sizes: [Size]
    let text: String
    let hasTags: Bool
    
    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case date
        case id
        case ownerID = "owner_id"
        case postID = "post_id"
        case sizes
        case text
        case hasTags = "has_tags"
    }
}

struct Size: Codable {
    let height: Int
    let url: String
    let type: String
    let width: Int
}


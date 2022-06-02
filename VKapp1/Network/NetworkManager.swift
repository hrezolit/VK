//
//  NetworkManager.swift
//  VKapp1
//
//  Created by Nikita on 24/5/22.
//

import Foundation

enum Location: String {
    case wall = "wall"
    case profile = "profile"
}

enum RequestType {
    case friendRequest
    case groupRequest
    case photoRequest
//    case searchGroupRequest
}

/// Class with requests methods for VK API
final class NetworkManager {

    private let token = MySession.shared.token
    private let userID = MySession.shared.userID

    private var components = URLComponents()



    /// load data method
    /// - Parameter requestType: enum with request types
    private func loadData(requestType: RequestType) {
        guard let url = components.url else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                switch requestType {
                case .friendRequest:
                    let result = try JSONDecoder().decode(User1.self, from: data)
                    print(result)
                case .groupRequest:
                    let result = try JSONDecoder().decode(Photos1.self, from: data)
                    print(result)
                case .photoRequest:
                    let result = try JSONDecoder().decode(GroupsVK.self, from: data)
                    print(result)
//                case .searchGroupRequest:
//                    let result = try JSONDecoder().decode(User1.self, from: data)
//                    print(result)
                }

            } catch {
                print(error)
            }
        }.resume()
    }

    /// VK API Friends data request method
    func fetchFriendsData() {
        guard MySession.shared.token != "" else { return }

        components.scheme = "https"
        components.host = "api.vk.com"
        components.path = "/method/friends.get"
        components.queryItems = [
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "v", value: "5.131"),
            URLQueryItem(name: "fields", value: "bdate,photo_100,online")
        ]

        loadData(requestType: .friendRequest)
    }

    /// VK API Photos data request method
    /// - Parameter location: .wall — photos from profile's wall, .profile - profile's photos
    func fetchPhotosData(from location: Location) {

        components.scheme = "https"
        components.host = "api.vk.com"
        components.path = "/method/photos.get"
        components.queryItems = [
            URLQueryItem(name: "owner_id", value: userID),
            URLQueryItem(name: "album_id", value: location.rawValue),
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "v", value: "5.131"),
        ]

        loadData(requestType: .photoRequest)
    }

    /// VK API Groups data request method
    func fetchGroupData() {

        components.scheme = "https"
        components.host = "api.vk.com"
        components.path = "/method/groups.get"
        components.queryItems = [

            URLQueryItem(name: "user_id", value: userID),
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "v", value: "5.131"),
            URLQueryItem(name: "extended", value: "1")

        ]

        loadData(requestType: .groupRequest)
    }

    /// VK API Searching Group data request method with keyword parameters
    /// - Parameter keyWord: keyword for search groups
//    func fetchSearchGroupData(with keyWord: String) {
//
//        components.scheme = "https"
//        components.host = "api.vk.com"
//        components.path = "/method/groups.search"
//        components.queryItems = [
//
//            URLQueryItem(name: "q", value: keyWord),
//            URLQueryItem(name: "access_token", value: token),
//            URLQueryItem(name: "v", value: "5.131")
//
//        ]
//
//        loadData()
//
//    }
}

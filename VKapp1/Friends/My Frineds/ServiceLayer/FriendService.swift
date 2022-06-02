//
//  FriendService.swift
//  VKapp1
//
//  Created by Олег Ганяхин on 01.06.2022.
//

import Foundation

final class FriendService {
	typealias FriendsResult = Result<[Item1], Constants.Service.ServiceError>

	private let session: URLSession = {
		let config = URLSessionConfiguration.default
		let session = URLSession(configuration: config)
		return session
	}()

	/// Загрузить список друзей
	/// - Parameter completion: Блок, обрабатывающий результат
	func loadFriendVK(completion: @escaping (FriendsResult) -> ()) {
		guard let token = MySession.shared.token else {
			return completion(.failure(.notConfigureURL))
		}

		let params: [String: String] = [
			"v" : "5.131",
			"fields": "bdate,photo_100,online"
		]

		do {
			let url: URL = try .configureUrl(token: token,
											 method: .friendsGet,
											 params: params)
			var request = URLRequest(url: url)
			request.httpMethod = Constants.Service.get.rawValue
			print(url)
			session.dataTask(with: request) { data, response, error in
				guard let data = data, error == nil else {
					return
				}
				let decoder = JSONDecoder()
				do {
					let result = try decoder.decode(User1.self, from: data)
                    completion(.success(result.response.items))
				} catch let error {
					print(error)
					completion(.failure(.parseError))
				}
			}.resume()
		} catch {
			completion(.failure(.notConfigureURL))
		}
	}
}

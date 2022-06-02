//
//  Constants.swift
//  VKapp1
//
//  Created by Олег Ганяхин on 01.06.2022.
//

import Foundation

//  Хранилище констант
struct Constants {
	/// Константы для сервисного слоя
	enum Service: String, CaseIterable {
		enum Paths: String, CaseIterable {
			case friendsGet = "/method/friends.get"
			case groupsGet = "/method/groups.get"
		}
		/// Ошибки сервисного слоя
		enum ServiceError: Error {
			///  Ошибка парсинга
			case parseError
			/// Не сконфигурировался URL
			case notConfigureURL
			/// Ошибка запроса
			case requestError(Error)
		}
		/// Схема запроса
		case scheme = "https"
		/// Хост запроса
		case host = "api.vk.com"
		/// Тип запроса GET
		case get = "GET"
		/// Тип запроса POST
		case post = "POST"
	}
}

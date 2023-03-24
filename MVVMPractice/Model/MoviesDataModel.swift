//
//  MoviesDataModel.swift
//  MVVMPractice
//
//  Created by Mohammad  Talha on 21/03/2023.
//

import Foundation

struct UsersData: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

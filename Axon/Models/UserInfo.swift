//
//  UserInfo.swift
//  Axon
//
//  Created by Yaroslav Zakharchuk on 1/24/19.
//  Copyright © 2019 Yaroslav Zakharchuk. All rights reserved.
//

import Foundation

struct User {
    let firthName: String
    let lastName: String
    let photo: URL
    let gender: String
    let phone: String
    let bDate: String
    let email: String
    let description: String
}

struct Article: Codable {
    let cell: String
    let dob: [Age]
    let email: String
    let gender: String
    let location: [Zone]
    let name: [Name]
    let phone: String
    let picture: [Photo]
}

struct Age: Codable {
    let date: Date
}

extension Age {
    enum CodingKeys: String, CodingKey {
        case date
    }
}

struct Zone: Codable {
    let city: String
}

extension Zone {
    enum CodingKeys: String, CodingKey {
        case city
    }
}

struct Name: Codable {
    let first: String
    let last: String
}

extension Name {
    enum CodingKeys: String, CodingKey {
        case first, last
    }
}

struct Photo: Codable {
    let large: URL?
    let medium: URL?
}

extension Photo {
    enum CodingKeys: String, CodingKey {
        case large, medium
    }
}

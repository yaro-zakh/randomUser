//
//  UserInfo.swift
//  Axon
//
//  Created by Yaroslav Zakharchuk on 1/24/19.
//  Copyright © 2019 Yaroslav Zakharchuk. All rights reserved.
//

import Foundation

struct Users: Codable {
    let results: [Info]
    
    private enum CodingKeys: String, CodingKey {
        case results
    }
}

struct Info: Codable {
    let cell: String
    let dob: Age
    let email: String
    let gender: String
    let location: Zone
    let name: Name
    let phone: String
    let picture: Photo
    
    private enum CodingKeys: String, CodingKey {
        case cell, dob, email, gender, location, name, phone, picture
    }
}

struct Age: Codable {
    let date: Date
    
    private enum CodingKeys: String, CodingKey {
        case date
    }
}

struct Zone: Codable {
    let city: String
    
    private enum CodingKeys: String, CodingKey {
        case city
    }
}

struct Name: Codable {
    let first: String
    let last: String
    
    private enum CodingKeys: String, CodingKey {
        case first, last
    }
}

struct Photo: Codable {
    let large: URL?
    let medium: URL?
    
    private enum CodingKeys: String, CodingKey {
        case large, medium
    }
}

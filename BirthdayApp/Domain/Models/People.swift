//
//  People.swift
//  BirthdayApp
//
//  Created by Amir on 13/12/2020.
//

import Foundation

struct PeopleResponse: Codable {
    let peoples: [People]
    
    enum CodingKeys: String, CodingKey {
        case peoples = "results"
    }
}

struct People: Codable {
    let name: Name
    let dateOfBirth: DateOfBirth
    
    enum CodingKeys: String, CodingKey {
        case name
        case dateOfBirth = "dob"
    }
    
    struct Name: Codable {
        let title: String
        let first: String
        let last: String
    }
    
    struct DateOfBirth: Codable {
        let date: String
        let age: Int
    }
}

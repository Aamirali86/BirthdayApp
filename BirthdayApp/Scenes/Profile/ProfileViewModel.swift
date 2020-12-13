//
//  ProfileViewModel.swift
//  BirthdayApp
//
//  Created by Amir on 13/12/2020.
//

import Foundation

protocol ProfileViewModelType {
    var name: String { get }
    var age: String { get }
}

final class ProfileViewModel: ProfileViewModelType {
    private let people: People
    
    //MARK:- Init
    
    init(people: People) {
        self.people = people
    }
    
    var name: String {
        "\(people.name)"
    }
    
    var age: String {
        "\(people.dateOfBirth.age) YEARS OLD"
    }
}

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
    func goBack()
}

final class ProfileViewModel: ProfileViewModelType {
    private let people: People
    private let coordinator: BirthdayListCoordinator
    
    //MARK:- Init
    
    init(people: People,
         coordinator: BirthdayListCoordinator) {
        self.people = people
        self.coordinator = coordinator
    }
    
    var name: String {
        "\(people.name.first) \(people.name.last)"
    }
    
    var age: String {
        "\(people.dateOfBirth.age) YEARS OLD"
    }
    
    func goBack() {
        coordinator.goBack()
    }
}

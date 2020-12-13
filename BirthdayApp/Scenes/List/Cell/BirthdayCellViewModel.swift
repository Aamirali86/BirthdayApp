//
//  BirthdayCellViewModel.swift
//  BirthdayApp
//
//  Created by Amir on 13/12/2020.
//

import Foundation

protocol BirthdayCellViewModelType {
    var name: String { get }
    var date: String { get }
}

final class BirthdayCellViewModel: BirthdayCellViewModelType {
    //MARK:- Properties
    
    private let people: People
    
    init(people: People) {
        self.people = people
    }
    
    var name: String {
        "\(people.name.first) \(people.name.last)"
    }
    
    var date: String {
        "\(people.dateOfBirth.date)"
    }
}

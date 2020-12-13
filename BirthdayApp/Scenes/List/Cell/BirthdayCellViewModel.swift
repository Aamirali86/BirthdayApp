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
    private let inputFormatter: DateFormatter
    private let outputFormatter: DateFormatter
    
    init(people: People) {
        self.people = people
        inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'"
        inputFormatter.locale = Locale.current
        inputFormatter.timeZone = TimeZone.current
        
        outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yyyy-MM-dd"
        outputFormatter.locale = Locale.current
        outputFormatter.timeZone = TimeZone.current
    }
    
    var name: String {
        "\(people.name.first) \(people.name.last)"
    }
    
    var date: String {
        guard let date = inputFormatter.date(from: people.dateOfBirth.date) else { return "" }
        return outputFormatter.string(from: date)
    }
}

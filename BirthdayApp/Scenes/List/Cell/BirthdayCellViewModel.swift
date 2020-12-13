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
    var name: String {
        "James"
    }
    
    var date: String {
        "24-12-99"
    }
}

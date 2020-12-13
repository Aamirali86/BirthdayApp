//
//  BirthdayListViewModel.swift
//  BirthdayApp
//
//  Created by Amir on 13/12/2020.
//

import Foundation
import Combine

protocol BirthdayListViewModelType {
    var peoples: CurrentValueSubject<[People], NetworkRequestError> { get }
}

final class BirthdayListViewModel: BirthdayListViewModelType {
    private let service: PeopleProviderType
    private var subscriptions = Set<AnyCancellable>()
    
    //MARK:- Init
    
    init(service: PeopleProviderType) {
        self.service = service
        fetchBirthdays()
    }
    
    var peoples: CurrentValueSubject<[People], NetworkRequestError> = CurrentValueSubject([])

    func fetchBirthdays() {
        service.fetchPeoples()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print(error.localizedDescription)
                }
            }, receiveValue: { [weak self] response in
                self?.peoples.send(response.peoples)
            })
            .store(in: &subscriptions)
    }
}

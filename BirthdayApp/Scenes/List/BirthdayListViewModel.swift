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
    var isLoading: CurrentValueSubject<Bool, Never> { get }
    func numberOfRows() -> Int
    func people(at index: Int) -> People
    func didClickRow(at index: Int)
}

final class BirthdayListViewModel: BirthdayListViewModelType {
    private let service: PeopleProviderType
    private let coordinator: BirthdayListCoordinator
    private var subscriptions = Set<AnyCancellable>()
    
    //MARK:- Init
    
    init(service: PeopleProviderType,
         coordinator: BirthdayListCoordinator) {
        self.service = service
        self.coordinator = coordinator
        fetchBirthdays()
    }
    
    var peoples: CurrentValueSubject<[People], NetworkRequestError> = CurrentValueSubject([])
    var isLoading: CurrentValueSubject<Bool, Never> = CurrentValueSubject(true)

    func fetchBirthdays() {
        service.fetchPeoples()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                if case let .failure(error) = completion {
                    self?.isLoading.send(false)
                    print(error.localizedDescription)
                }
            }, receiveValue: { [weak self] response in
                self?.isLoading.send(false)
                self?.peoples.send(response.peoples)
            })
            .store(in: &subscriptions)
    }
    
    func numberOfRows() -> Int {
        peoples.value.count
    }
    
    func people(at index: Int) -> People {
        peoples.value[index]
    }
    
    func didClickRow(at index: Int) {
        coordinator.navigateToProfile(with: peoples.value[index])
    }
}

//
//  PeopleProvider.swift
//  BirthdayApp
//
//  Created by Amir on 13/12/2020.
//

import Foundation
import Combine

protocol PeopleProviderType {
    /// Fetch currently available movies
    func fetchPeoples() -> AnyPublisher<PeopleResponse, NetworkRequestError>
}

////// A class encapsulating logic to provide content for movies
final class PeopleProvider: PeopleProviderType {
    //MARK:- Properties
    
    typealias ResponseType = PeopleResponse
    private let movieAPI: PeopleAPI
    
    //MARK:- Init
    
    init(movieAPI: PeopleAPI = NetworkManager.getSharedInstance()) {
        self.movieAPI = movieAPI
    }
    
    //MARK:- Functions

    func fetchPeoples() -> AnyPublisher<ResponseType, NetworkRequestError> {
        movieAPI
            .requestPeoples()
            .decode(type: ResponseType.self, decoder: JSONDecoder())
            .mapError { error in
                if let error = error as? NetworkRequestError {
                    return error
                } else {
                    return NetworkRequestError.serverError(error: error.localizedDescription)
                }
            }
            .eraseToAnyPublisher()
    }
}

/// A type representing Movies required network data access
protocol PeopleAPI {
    func requestPeoples() -> AnyPublisher<Data, NetworkRequestError>
}

extension NetworkManager: PeopleAPI {
    func requestPeoples() -> AnyPublisher<Data, NetworkRequestError> {
        execute(request: EndPointProvider(with: "https://randomuser.me/api/?results=100&seed=chalkboard&inc=name,dob"))
    }
}

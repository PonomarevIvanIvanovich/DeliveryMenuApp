//
//  NetworkDataFetcher.swift
//  Restaurant
//
//  Created by Иван Пономарев on 28.01.2023.
//

import Foundation

protocol NetworkDataFetcherLogic {
    func fetchAddres(searchTerm: String, completion: @escaping (Result<AddresResultModel?, Error>) -> ())
}

final class NetworkDataFetcher: NetworkDataFetcherLogic {
    private let queryCreator = ServiceSuggestion()

    func fetchAddres(searchTerm: String, completion: @escaping (Result<AddresResultModel?, Error>) -> ()) {
        queryCreator.createRequest(search: searchTerm, completion: { data, error in
            if let error = error {
                completion(.failure(error))
            }
            let decode = self.decodeJSONE( type: AddresResultModel.self, from: data)
            completion(.success(decode))
        })
    }

    private func decodeJSONE<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        do {
            let object = try decoder.decode(type.self, from: data)
            return object
        } catch let jsoneError {
            print("Failed to decode JSONE", jsoneError)
            return nil
        }
    }
}

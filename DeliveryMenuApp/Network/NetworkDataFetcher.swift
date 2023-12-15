//
//  NetworkDataFetcher.swift
//  Restaurant
//
//  Created by Иван Пономарев on 28.01.2023.
//

import Foundation

protocol NetworkDataFetcherLogic {
    func fetchAddres(searchTerm: String, completion: @escaping(AddresResultModel?) -> ())
}

final class NetworkDataFetcher: NetworkDataFetcherLogic {
    private let queryCreator = ServiceSuggestion()

    func fetchAddres(searchTerm: String, completion: @escaping(AddresResultModel?) -> ()) {
        queryCreator.createRequest(search: searchTerm, completion: { data, error in
            if let error = error {
                print("Error received request data: \(error.localizedDescription)")
                completion(nil)
            }
            let decode = self.decodeJSONE( type: AddresResultModel.self, from: data)
            completion(decode)
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

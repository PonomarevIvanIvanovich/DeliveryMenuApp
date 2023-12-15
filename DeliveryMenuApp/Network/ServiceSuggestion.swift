//
//  QueryCreator.swift
//  Restaurant
//
//  Created by Иван Пономарев on 28.01.2023.
//

import Foundation
import Alamofire

final class ServiceSuggestion {
    func createRequest(search: String, completion: @escaping(Data?, Error?) -> Void){
        guard let urlString = createURL() else { return }
        let headers: HTTPHeaders = [
            "Accept" : "application/json",
            "Content-Type" : "application/json; charset=utf-8",
            "Authorization" : "Token be1cdfdbf5849ff688fae0aa87e776cd3fdc45d3"
        ]
        let searchBody = "{\"query\" : \"\(search)\"}"
        let request = AF.request(urlString, method: .post, parameters: [:], encoding: searchBody, headers: headers)
        request.response { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }

    private func createURL() -> String? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "suggestions.dadata.ru"
        components.path = "/suggestions/api/4_1/rs/suggest/address"
        guard let componentsURL = components.url else { return nil }
        return componentsURL.absoluteString
    }
}

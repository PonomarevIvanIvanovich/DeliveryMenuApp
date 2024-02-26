//
//  SearchScreenPresenter.swift
//  DeliveryMenuApp
//
//  Created by Иван Пономарев on 24.01.2024.
//

import UIKit

protocol SearchScreenPresenterProtocol: AnyObject {
    var suggestions: [SuggestionData] { get set }
    var router: SearchScreenRouterProtocol? { get set }
    func getAddress(address: String)
}

final class SearchScreenPresenter: SearchScreenPresenterProtocol {
    var router: SearchScreenRouterProtocol?
    var suggestions = [SuggestionData]()
    weak var searchScreenView: SearchScreenViewProtocol?
    var networkDataFetcher: NetworkDataFetcher?

    init(searchScreenView: SearchScreenViewProtocol, networkDataFetcher: NetworkDataFetcher, router : SearchScreenRouterProtocol) {
        self.searchScreenView = searchScreenView
        self.networkDataFetcher = networkDataFetcher
        self.router = router
    }

    func getAddress(address: String) {
        networkDataFetcher?.fetchAddres(searchTerm: address) { result in
            switch result {
            case .success(let result) :
                guard let result = result else { return }
                let suggestions = result.suggestions.map { $0.data }
                self.suggestions = suggestions.filter{ $0.street_with_type != nil }
                self.searchScreenView?.success()
            case .failure(let error):
                self.searchScreenView?.falture(error: error)
            }
        }
    }
}

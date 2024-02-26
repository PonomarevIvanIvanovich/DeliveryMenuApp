//
//  SearchScreenAssemblyBuilder.swift
//  DeliveryMenuApp
//
//  Created by Иван Пономарев on 24.01.2024.
//

import UIKit
import PanModal

protocol SearchScreenAssemblyBuilderProtocol {
    static func createSearchScreenModul(navigationController: UINavigationController) -> SearchAddressBottomSheet
}

final class SearchScreenAssemblyBuilder: SearchScreenAssemblyBuilderProtocol {
    static func createSearchScreenModul(navigationController: UINavigationController) -> SearchAddressBottomSheet {
        let view = SearchAddressBottomSheet()
        view.delegate = navigationController.topViewController as? any AddressDelegate
        let networkDataFetcher = NetworkDataFetcher()
        let router = SearchScreenRouter(navigationController: navigationController)
        let presenter = SearchScreenPresenter(
            searchScreenView: view,
            networkDataFetcher: networkDataFetcher,
            router: router
        )
        view.presenter = presenter
        return view
    }
}

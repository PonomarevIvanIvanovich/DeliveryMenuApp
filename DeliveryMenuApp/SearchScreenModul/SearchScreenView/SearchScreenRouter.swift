//
//  SearchScreenRouter.swift
//  DeliveryMenuApp
//
//  Created by Иван Пономарев on 25.01.2024.
//

import UIKit

protocol SearchScreenRouterProtocol: MainRouterProtocol {

}

final class SearchScreenRouter: SearchScreenRouterProtocol {
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

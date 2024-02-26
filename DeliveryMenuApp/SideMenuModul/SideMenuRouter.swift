//
//  SideMenuRouter.swift
//  DeliveryMenuApp
//
//  Created by Иван Пономарев on 24.01.2024.
//

import UIKit

protocol SideMenuRouterProtocol: MainRouterProtocol {
    
}

final class SideMenuRouter: SideMenuRouterProtocol {
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

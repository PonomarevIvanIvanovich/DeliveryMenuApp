//
//  MainScreenRouter.swift
//  DeliveryMenuApp
//
//  Created by Иван Пономарев on 24.01.2024.
//

import UIKit
import SideMenu
import PanModal

protocol MainScreenRouterProtocol: MainRouterProtocol {
    func openSideMenu()
    func openSearchScreen()
}

final class MainScreenRouter: MainScreenRouterProtocol {
    var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func openSideMenu() {
        if let navigationController = navigationController {
            let leftMenu = AsseblyBuilderSideMenu.createModul(navigationController: navigationController)
            let sidemenu = SideMenuNavigationController(rootViewController: leftMenu)
            sidemenu.leftSide = true
            sidemenu.menuWidth = 350
            navigationController.present(sidemenu, animated: true)
        }
    }
    
    func openSearchScreen() {
        if let navigationController = navigationController {
            let searchScreen = SearchScreenAssemblyBuilder.createSearchScreenModul(navigationController: navigationController)
            navigationController.presentPanModal(searchScreen)
        }
    }
}

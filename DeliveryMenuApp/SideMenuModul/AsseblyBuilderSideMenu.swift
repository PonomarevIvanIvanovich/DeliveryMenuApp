//
//  AsseblyBuilderSideMenu.swift
//  DeliveryMenuApp
//
//  Created by Иван Пономарев on 24.01.2024.
//

import UIKit

final class AsseblyBuilderSideMenu: AsseblyBuilderProtocol {
    static func createModul(navigationController: UINavigationController) -> UIViewController {
        let router = SideMenuRouter(navigationController: navigationController)
        let view = LeftMenuViewController()
        let presenter = SideMenuPresenter(sideMenuVC: view, router: router)
        view.presenter = presenter
        return view
    }
}

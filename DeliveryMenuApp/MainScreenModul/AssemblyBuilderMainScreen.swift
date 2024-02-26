//
//  File.swift
//  DeliveryMenuApp
//
//  Created by Иван Пономарев on 24.01.2024.
//

import UIKit

protocol AsseblyBuilderProtocol {
    static func createModul(navigationController: UINavigationController) -> UIViewController
}

final class AssemblyBuilderMainScreen: AsseblyBuilderProtocol {
    static func createModul(navigationController: UINavigationController) -> UIViewController {
        let view = MainScreenViewControler()
        let router = MainScreenRouter(navigationController: navigationController)
        let presenter = MainScreenPresenter(mainScreenView: view, router: router)
        view.presenter = presenter
        return view
    }
}



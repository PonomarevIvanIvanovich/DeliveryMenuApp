//
//  SideMenuPresenter.swift
//  DeliveryMenuApp
//
//  Created by Иван Пономарев on 24.01.2024.
//

import UIKit

protocol SideMenuPresenterProtocol: AnyObject {
    var router: SideMenuRouterProtocol? { get set }
    var cellArray: [String]? { get set }
    func getModel()
    func getUser()
}

final class SideMenuPresenter: SideMenuPresenterProtocol {
    var cellArray: [String]?
    weak var sideMenuVC: SideMenuViewProtocol?
    var router: SideMenuRouterProtocol?

    init(sideMenuVC: SideMenuViewProtocol, router: SideMenuRouterProtocol) {
        self.sideMenuVC = sideMenuVC
        self.router = router
    }

    func getModel() {
        cellArray = SideMenuModel.model
        sideMenuVC?.reloadCell()
    }

    func getUser() {
        sideMenuVC?.userSetup(user: UserModel())
    }
}

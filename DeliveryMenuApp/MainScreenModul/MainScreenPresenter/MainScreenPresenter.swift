//
//  MainScreenPresenter.swift
//  DeliveryMenuApp
//
//  Created by Иван Пономарев on 24.01.2024.
//

import UIKit

protocol MainScreenViewProtocol: AnyObject {
    var presenter: MainScreenPresenterProtocol? { get set }
}

protocol MainScreenPresenterProtocol: AnyObject {
    func openSideMenu()
    func openSearchScreen()
    func setModel()
    func tappedHearhButton()
}

final class MainScreenPresenter: MainScreenPresenterProtocol {
    weak var mainScreenView: MainScreenViewControler?
    var router: MainScreenRouterProtocol?

    required init(mainScreenView: MainScreenViewControler, router: MainScreenRouterProtocol) {
        self.mainScreenView = mainScreenView
        self.router = router
    }
    
    func openSideMenu() {
        router?.openSideMenu()
    }
    
    func openSearchScreen() {
        router?.openSearchScreen()
    }

    func setModel() {
        mainScreenView?.promoBannerCollection.set(cell: PromoBannerModel.fatchPromo())
        mainScreenView?.discountProductCollectionView.set(cell: DiscountProductModel.fatchPromo())
        mainScreenView?.catalogCollectionView.set(cell: CatalogModel.fatchPromo())
        mainScreenView?.promoSectionCollectionView.set(cell: PromoSectionModel.fatchPromo())
    }

    func tappedHearhButton() {
        print("tappedHearhButton")
    }
}

//
//  CatalogModel.swift
//  Restaurant
//
//  Created by Иван Пономарев on 27.01.2023.
//

import Foundation
import UIKit

struct CatalogModel {
    var image: UIImage?
    var title: String
    var color: UIColor

    static func fatchPromo() -> [CatalogModel] {
        let firstItem = CatalogModel(
            image: UIImage(named: "catalog1"),
            title: "Наборы",
            color: UIColor(red: 1, green: 0.757, blue: 0.714, alpha: 1))
        let secondItem = CatalogModel(
            image: UIImage(named: "catalog2"),
            title: "Пицца",
            color: UIColor(red: 1, green: 0.882, blue: 0.678, alpha: 1)
        )
        let thirdItem = CatalogModel(
            image: UIImage(named: "discount1"),
            title: "Паста",
            color: UIColor(red: 0.729, green: 0.722, blue: 0.573, alpha: 1)
        )
        let fourthItem = CatalogModel(
            image: UIImage(named: "discount2"),
            title: "Ризотто",
            color: UIColor(red: 0.769, green: 0.827, blue: 0.808, alpha: 1)
        )
        let fifthItem = CatalogModel(
            image: UIImage(named: "discount1"),
            title: "Салаты",
            color: UIColor(red: 0.725, green: 0.769, blue: 0.784, alpha: 1)
        )
        let sixthItem = CatalogModel(
            image: UIImage(named: "catalog6"),
            title: "Полуфабрикаты",
            color: UIColor(red: 0.725, green: 0.769, blue: 0.784, alpha: 1)
        )
        let seventhItem = CatalogModel(
            image: UIImage(named: "catalog9"),
            title: "Десетры",
            color: UIColor(red: 1, green: 0.903, blue: 0.714, alpha: 1)
        )
        let eighthItem = CatalogModel(
            image: UIImage(named: "catalog6"),
            title: "Добавки к блюдам",
            color: UIColor(red: 0.827, green: 0.769, blue: 0.769, alpha: 1)
        )
        let ninthItem = CatalogModel(
            image: UIImage(named: "catalog9"),
            title: "Напитки",
            color: UIColor(red: 1, green: 0.833, blue: 0.678, alpha: 1)
        )
        return [firstItem, secondItem, thirdItem, fourthItem, fifthItem, sixthItem, seventhItem, eighthItem, ninthItem]
    }
}

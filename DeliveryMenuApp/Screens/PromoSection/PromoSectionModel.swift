//
//  PromoSectionModel.swift
//  Restaurant
//
//  Created by Иван Пономарев on 26.01.2023.
//

import Foundation
import UIKit

struct PromoSectionModel {
    var mainImage: UIImage?
    var name: String

    static func fatchPromo() -> [PromoSectionModel] {
        let firstItem = PromoSectionModel(
            mainImage: UIImage(named:"section1"),
            name: "Летний пикник"
        )
        let secondItem = PromoSectionModel(
            mainImage: UIImage(named:"section2"),
            name: "Летний обед"
        )
        let thirdItem = PromoSectionModel(
            mainImage: UIImage(named:"section3"),
            name: "На завтрак"
        )
        let fouthItem = PromoSectionModel(
            mainImage: UIImage(named:"section4"),
            name: "На ужин"
        )
        let fiveItem = PromoSectionModel(
            mainImage: UIImage(named:"section1"),
            name: "Летний пикник"
        )
        let sixItem = PromoSectionModel(
            mainImage: UIImage(named:"section2"),
            name: "Летний обед"
        )
        let sevenitem = PromoSectionModel(
            mainImage: UIImage(named:"section3"),
            name: "На завтрак"
        )
        return [firstItem, secondItem, thirdItem, fouthItem, fiveItem, sixItem, sevenitem]
    }
}

//
//  PromoBannerModel.swift
//  Restaurant
//
//  Created by Иван Пономарев on 26.01.2023.
//

import Foundation
import UIKit

struct PromoBannerModel {
    var mainImage: UIImage?
    var promoLabel: String?
    var titleLabel: String?

    static func fatchPromo() -> [PromoBannerModel] {
        let firstItem = PromoBannerModel(
            mainImage: UIImage(named: "banner1"),
            promoLabel: "В честь открытия",
            titleLabel: "Скидки 20%"
        )
        let secondItem = PromoBannerModel(
            mainImage: UIImage(named: "banner2")
        )
        return [firstItem, secondItem, firstItem, secondItem, firstItem, secondItem, firstItem]
    }
}

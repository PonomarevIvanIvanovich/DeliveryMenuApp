//
//  CatalogCell.swift
//  Restaurant
//
//  Created by Иван Пономарев on 27.01.2023.
//

import Foundation
import UIKit
import SnapKit

final class CatalogCell: UICollectionViewCell {
    static let identyfier = "CatalogCell"
    private let foodImage = UIImageView()
    private let titlelabel: UILabel = {
        let titlelabel = UILabel()
        titlelabel.font = FontContants.sfSemibold14
        titlelabel.textAlignment = .center
        titlelabel.numberOfLines = 2
        return titlelabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell(model: CatalogModel) {
        foodImage.image = model.image
        titlelabel.text = model.title
        backgroundColor = model.color
    }

    private func setupUI() {
        layer.masksToBounds = true
        layer.cornerRadius = 15
        contentView.addSubview(foodImage)
        foodImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(5)
            make.height.equalTo(80)
            make.width.equalTo(80)
        }

        contentView.addSubview(titlelabel)
        titlelabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(75)
        }
    }
}


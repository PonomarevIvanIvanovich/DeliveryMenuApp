//
//  PromoBannerCell.swift
//  Restaurant
//
//  Created by Иван Пономарев on 26.01.2023.
//

import Foundation
import UIKit
import SnapKit

final class PromoBannerCell: UICollectionViewCell {
    static let identyfier = "PromoBannerCell"

    private let promoImage: UIImageView = {
        let sectionImage = UIImageView()
        return sectionImage
    }()

    private let promoLabel: UILabel = {
        let promoLabel = UILabel()
        promoLabel.font = FontContants.robotoRegular15
        promoLabel.textColor = .white
        return promoLabel
    }()

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = FontContants.robotoRegular25
        titleLabel.textColor = .white
        return titleLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell(model: PromoBannerModel) {
        promoImage.image = model.mainImage
        promoLabel.text = model.promoLabel
        titleLabel.text = model.titleLabel
    }

    private func setupUI() {
        layer.masksToBounds = true
        layer.cornerRadius = 15
        contentView.addSubview(promoImage)
        promoImage.layer.cornerRadius = 15
        promoImage.snp.makeConstraints { make in
            make.left.right.bottom.top.equalToSuperview()
        }

        promoImage.addSubview(promoLabel)
        promoLabel.snp.makeConstraints { make in
            make.top.equalTo(promoImage.snp.centerY)
            make.left.equalToSuperview().inset(10)
            make.height.equalTo(20)
            make.width.equalTo(150)
        }

        promoImage.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(promoLabel.snp.bottom).inset(5)
            make.left.equalToSuperview().inset(10)
            make.height.equalTo(30)
            make.width.equalTo(150)
        }
    }
}


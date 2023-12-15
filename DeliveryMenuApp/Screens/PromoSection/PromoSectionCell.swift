//
//  PromoSectionCell.swift
//  Restaurant
//
//  Created by Иван Пономарев on 25.01.2023.
//

import Foundation
import UIKit
import SnapKit

final class PromoSectionCell: UICollectionViewCell {
    static let identyfier = "PromoSectionCell"
    private let sectionImage: UIImageView = {
        let sectionImage = UIImageView()
        return sectionImage
    }()
    
    private let sectionLabel: UILabel = {
        let sectionLabel = UILabel()
        sectionLabel.textAlignment = .center
        sectionLabel.font = FontContants.sfRegular14
        return sectionLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configCell(model: PromoSectionModel) {
        sectionImage.image = model.mainImage
        sectionLabel.text = model.name
    }

    private func setupUI() {
        contentView.addSubview(sectionLabel)
        sectionLabel.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(15)
        }

        contentView.addSubview(sectionImage)
        sectionImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().inset(5)
            make.right.equalToSuperview().inset(5)
            make.height.equalTo(53)
        }
    }
}

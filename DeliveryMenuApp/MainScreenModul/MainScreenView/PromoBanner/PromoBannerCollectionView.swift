//
//  PromoBannerCollection.swift
//  Restaurant
//
//  Created by Иван Пономарев on 26.01.2023.
//
import Foundation
import UIKit
import SnapKit

final class PromoBannerCollection: UICollectionView {
    private var cellArray = [PromoBannerModel]()

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        setupPromoBannerCollectionView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupPromoBannerCollectionView() {
        register(PromoBannerCell.self, forCellWithReuseIdentifier: PromoBannerCell.identyfier)
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        delegate = self
        dataSource = self
    }

    func set(cell: [PromoBannerModel]) {
        self.cellArray = cell
    }
}
//MARK: - UICollectionViewDelegate

extension PromoBannerCollection: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(cellArray[indexPath.row].titleLabel ?? "tapped promo banner")
    }
}

//MARK: - UICollectionViewDataSource

extension PromoBannerCollection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PromoBannerCell.identyfier,
            for: indexPath
        ) as? PromoBannerCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(model: cellArray[indexPath.row])
        return cell
    }
}

//MARK: - UICollectionViewDataSource

extension PromoBannerCollection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 280, height: collectionView.frame.height)
    }
}



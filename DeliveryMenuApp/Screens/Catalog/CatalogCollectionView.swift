//
//  CatalogCollectionView.swift
//  Restaurant
//
//  Created by Иван Пономарев on 27.01.2023.
//

import Foundation
import UIKit
import SnapKit

final class CatalogCollectionView: UICollectionView {
    private var cellArray = [CatalogModel]()

    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(frame: .zero, collectionViewLayout: layout)
        setupCatalogCollectionView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCatalogCollectionView() {
        register(CatalogCell.self, forCellWithReuseIdentifier: CatalogCell.identyfier)
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        delegate = self
        dataSource = self
        isScrollEnabled = false
    }

    func set(cell: [CatalogModel]) {
        self.cellArray = cell
    }
}

//MARK: - UICollectionViewDelegate

extension CatalogCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapped catalog")
    }
}

//MARK: - UICollectionViewDataSource

extension CatalogCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CatalogCell.identyfier,
            for: indexPath
        ) as? CatalogCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(model: cellArray[indexPath.row])
        return cell
    }
}

//MARK: - UICollectionViewDataSource

extension CatalogCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 3 - 8) , height: 135)
    }
}


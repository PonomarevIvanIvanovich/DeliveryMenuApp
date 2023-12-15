//
//  MainScreenViewControler.swift
//  Restaurant
//
//  Created by Иван Пономарев on 24.01.2023.
//

import UIKit
import SnapKit

protocol MainScreenViewControlerDelegate: AnyObject {
    func toggleMenu()
}

final class MainScreenViewControler: UIViewController, UISearchBarDelegate {
    weak var delegate: MainScreenViewControlerDelegate?
    var clouser: ((String) -> ())?
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = ColorConstants.accentColor
        return scrollView
    }()

    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = ColorConstants.accentColor
        return contentView
    }()
    
    private let leftMenuButton: UIButton = {
        let leftMenuButton = UIButton()
        leftMenuButton.setImage(UIImage(named: "menu"), for: .normal)
        leftMenuButton.sizeToFit()
        return leftMenuButton
    }()

    private let deliveryLabel: UILabel = {
        let deliveryLabel = UILabel()
        deliveryLabel.textColor = ColorConstants.greyText
        deliveryLabel.text = "Доставка"
        deliveryLabel.font = FontContants.sfRegular12
        return deliveryLabel
    }()

    let addressLabel: UILabel = {
        let addressLabel = UILabel()
        addressLabel.text = "Ижевск"
        addressLabel.font = FontContants.sfRegular16
        return addressLabel
    }()

    private let searchAddressButton: UIButton = {
        let searchAddressButton = UIButton()
        searchAddressButton.setImage(UIImage(named: "down"), for: .normal)
        return searchAddressButton
    }()

    lazy var searchBar:UISearchBar = UISearchBar()

    private let hearhButton: UIButton = {
        let hearhButton = UIButton()
        hearhButton.layer.cornerRadius = 15
        hearhButton.backgroundColor = ColorConstants.accentBackground
        hearhButton.setImage(UIImage(named: "love"), for: .normal)
        return hearhButton
    }()

    private let promoSectionCollectionView = PromoSectionCollectionView()
    private let promoBannerCollection = PromoBannerCollection()

    private let discountLabel: UILabel = {
        let discountLabel = UILabel()
        discountLabel.text = "Акции"
        discountLabel.font = FontContants.sfRegular20
        return discountLabel
    }()

    private let lookButton: UIButton = {
        let lookButton = UIButton()
        lookButton.titleLabel?.font =  FontContants.sfRegular12
        lookButton.setTitle("Смотреть все >", for: .normal)
        lookButton.setTitleColor(.black, for: .normal)
        lookButton.layer.cornerRadius = 15
        lookButton.backgroundColor = ColorConstants.accentBackground
        return lookButton
    }()

    private let discountProductCollectionView = DiscountProductCollectionView()

    private let catalogLabel: UILabel = {
        let catalogLabel = UILabel()
        catalogLabel.text = "Каталог"
        catalogLabel.font = FontContants.sfRegular20
        return catalogLabel
    }()

    private let catalogCollectionView = CatalogCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSearchBar()
        setupTargetButton()
        appendPromoSection()
    }

// MARK: - Setup action

    private func setupTargetButton() {
        searchAddressButton.addTarget(self, action: #selector(tappedSearchAddressButton), for: .touchUpInside)
        leftMenuButton.addTarget(self, action: #selector(tappedLeftMenuButton), for: .touchUpInside)
        hearhButton.addTarget(self, action: #selector(tappedhearhButton), for: .touchUpInside)
    }

    @objc func tappedSearchAddressButton() {
        let searchAddressVC = SearchAddressBottomSheet()
        searchAddressVC.clouse = { [weak self] address in
            self?.addressLabel.text = address
        }
        if let sheet = searchAddressVC.sheetPresentationController {
            sheet.prefersGrabberVisible = true
            sheet.prefersScrollingExpandsWhenScrolledToEdge = true
            sheet.detents = [.large()]
        }
        present(searchAddressVC, animated: true)
    }

    @objc func tappedhearhButton() {
        print("tappedhearhButton")
    }

    @objc func tappedLeftMenuButton() {
        delegate?.toggleMenu()
    }

    private func setupSearchBar() {
        searchBar.searchBarStyle = UISearchBar.Style.minimal
        searchBar.placeholder = "Поиcк товаров"
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.showsScopeBar = true
        searchBar.barTintColor = ColorConstants.accentBackground
        searchBar.delegate = self
    }

    func setupAddress(street: String) {
        addressLabel.text = street
    }

    private func appendPromoSection() {
        promoSectionCollectionView.set(cell: PromoSectionModel.fatchPromo())
        promoBannerCollection.set(cell: PromoBannerModel.fatchPromo())
        discountProductCollectionView.set(cell: DiscountProductModel.fatchPromo())
        catalogCollectionView.set(cell: CatalogModel.fatchPromo())
    }

// MARK: - Setup constraints

    private func setupUI() {
        view.backgroundColor = ColorConstants.accentColor
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.left.right.height.width.bottom.equalTo(view.safeAreaLayoutGuide)
        }

        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.width.top.equalToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
        }

        contentView.addSubview(leftMenuButton)
        leftMenuButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(11)
            make.height.width.equalTo(25)
        }

        contentView.addSubview(deliveryLabel)
        deliveryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().inset(65)
            make.height.equalTo(20)
            make.width.equalTo(85)
        }

        contentView.addSubview(addressLabel)
        addressLabel.snp.makeConstraints { make in
            make.top.equalTo(deliveryLabel.snp.bottom)
            make.left.equalToSuperview().inset(65)
            make.height.equalTo(20)
            make.width.equalTo(102)
        }

        contentView.addSubview(searchAddressButton)
        searchAddressButton.snp.makeConstraints { make in
            make.centerY.equalTo(addressLabel.snp.centerY)
            make.left.equalTo(addressLabel.snp.right).inset(-6)
            make.height.equalTo(10)
            make.width.equalTo(12)
        }

        contentView.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(addressLabel.snp.bottom).inset(-16)
            make.height.equalTo(35)
            make.right.equalToSuperview().inset(55)
            make.left.equalToSuperview().inset(15)
        }

        contentView.addSubview(hearhButton)
        hearhButton.snp.makeConstraints { make in
            make.centerY.equalTo(searchBar.snp.centerY)
            make.height.width.equalTo(30)
            make.left.equalTo(searchBar.snp.right)
        }

        contentView.addSubview(promoSectionCollectionView)
        promoSectionCollectionView.backgroundColor = ColorConstants.accentColor
        promoSectionCollectionView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(15)
            make.right.equalToSuperview()
            make.top.equalTo(searchBar.snp.bottom).inset(-20)
            make.height.equalTo(80)
        }
        
        contentView.addSubview(promoBannerCollection)
        promoBannerCollection.backgroundColor = ColorConstants.accentColor
        promoBannerCollection.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(15)
            make.right.equalToSuperview()
            make.top.equalTo(promoSectionCollectionView.snp.bottom).inset(-20)
            make.height.equalTo(110)
        }

        contentView.addSubview(discountLabel)
        discountLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(15)
            make.top.equalTo(promoBannerCollection.snp.bottom).inset(-20)
            make.height.equalTo(20)
            make.width.equalTo(70)
        }

        contentView.addSubview(lookButton)
        lookButton.snp.makeConstraints { make in
            make.centerY.equalTo(discountLabel.snp.centerY)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(25)
            make.width.equalTo(103)
        }

        contentView.addSubview(discountProductCollectionView)
        discountProductCollectionView.backgroundColor = ColorConstants.accentColor
        discountProductCollectionView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(15)
            make.right.equalToSuperview()
            make.top.equalTo(discountLabel.snp.bottom).inset(-20)
            make.height.equalTo(208)
        }

        contentView.addSubview(catalogLabel)
        catalogLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(15)
            make.top.equalTo(discountProductCollectionView.snp.bottom).inset(-20)
            make.height.equalTo(20)
            make.width.equalTo(100)
        }

        contentView.addSubview(catalogCollectionView)
        catalogCollectionView.backgroundColor = ColorConstants.accentColor
        catalogCollectionView.snp.makeConstraints { make in
            make.top.equalTo(catalogLabel.snp.bottom).inset(-20)
            make.left.right.equalToSuperview().inset(15)
            make.height.equalTo(440)
            make.bottom.equalToSuperview()
        }
    }
}


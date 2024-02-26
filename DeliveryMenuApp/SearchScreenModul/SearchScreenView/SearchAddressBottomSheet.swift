//
//  SearchAddressBottomSheet.swift
//  Restaurant
//
//  Created by Иван Пономарев on 25.01.2023.
//

import UIKit
import SnapKit
import PanModal

protocol SearchScreenViewProtocol: AnyObject {
    func success()
    func falture(error: Error)
}

protocol AddressDelegate: AnyObject {
    func addressCollect(address: String)
}

final class SearchAddressBottomSheet: UIViewController, PanModalPresentable {
    weak var delegate: AddressDelegate?
    var presenter: SearchScreenPresenterProtocol?
    private var networkDataFetch = NetworkDataFetcher()
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    lazy var searchBar:UISearchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSearchBar()
        setupTableView()
    }

    private func setupTableView() {
        if let sheet = self.sheetPresentationController {
            sheet.prefersGrabberVisible = true
            sheet.prefersScrollingExpandsWhenScrolledToEdge = true
            sheet.detents = [.large()]
        }
        tableView.rowHeight = 50
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SearchAddressCell.self, forCellReuseIdentifier: SearchAddressCell.identifier)
    }

    private func setupSearchBar() {
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = "Введите адрес"
        searchBar.delegate = self
        searchBar.isTranslucent = true
        searchBar.barTintColor = .white
        searchBar.tintColor = .white
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().inset(20)
        }

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.bottom.left.right.equalToSuperview()
        }
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension SearchAddressBottomSheet: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.suggestions.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SearchAddressCell.identifier,
            for: indexPath
        ) as? SearchAddressCell else {
            return UITableViewCell()
        }
        if let presenter = presenter {
            cell.configurCell(model: presenter.suggestions[indexPath.row])
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let presenter = presenter else { return }
        let streeString = presenter.suggestions[indexPath.row].street_with_type ?? ""
        let houseString = presenter.suggestions[indexPath.row].house ?? ""
        let address = streeString + " " + houseString
        let city = presenter.suggestions[indexPath.row].city ?? ""
        if presenter.suggestions[indexPath.row].house != nil {
            delegate?.addressCollect(address: address)
            dismiss(animated: true)
        }
        else {
            searchBar.text = [city, address].joined(separator: " ")
            presenter.getAddress(address: city + " " + address + " ")
        }
    }
}

extension SearchAddressBottomSheet: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delaySearch(text: searchText, action: #selector(delaySearch(with:)), afterDelay: 0.3)
    }

    @objc func delaySearch(with: String) {
        presenter?.getAddress(address: with)
    }
}

extension SearchAddressBottomSheet: SearchScreenViewProtocol {
    var panScrollable: UIScrollView? {
        return nil
    }

    func success() {
        tableView.reloadData()
    }

    func falture(error: Error) {
        print(error.localizedDescription)
    }
}

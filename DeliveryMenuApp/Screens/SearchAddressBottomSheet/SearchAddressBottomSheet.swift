//
//  SearchAddressBottomSheet.swift
//  Restaurant
//
//  Created by Иван Пономарев on 25.01.2023.
//

import Foundation
import UIKit
import SnapKit

final class SearchAddressBottomSheet: UIViewController {
    private let defaults = UserDefaults.standard
    private var networkDataFetch = NetworkDataFetcher()
    private var suggestions = [SuggestionData]()
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    var clouse: ((String) -> ())?

    lazy var searchBar:UISearchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSearchBar()
        setupTableView()
        searchBar.text = defaults.string(forKey: "key")
        postRequest(searchText: searchBar.text ?? "")
    }

    private func postRequest(searchText: String) {
        networkDataFetch.fetchAddres(searchTerm: searchText) { result in
            guard let result = result else { return }
            let suggestions = result.suggestions.map { $0.data }
            self.suggestions = suggestions.filter{ $0.street_with_type != nil }
            self.tableView.reloadData()
        }
    }

    private func setupTableView() {
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
        suggestions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SearchAddressCell.identifier,
            for: indexPath
        ) as? SearchAddressCell else {
            return UITableViewCell()
        }
        cell.configurCell(model: suggestions[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let streeString = suggestions[indexPath.row].street_with_type ?? ""
        let houseString = suggestions[indexPath.row].house ?? ""
        let address = streeString + " " + houseString
        let city = suggestions[indexPath.row].city ?? ""
        if suggestions[indexPath.row].house != nil {
            defaults.set(city, forKey: "key")
            clouse?(address)
            dismiss(animated: true)
        } else {
            searchBar.text = [city, address].joined(separator: " ")
            postRequest(searchText:city + " " + address + " ")
        }
    }
}

extension SearchAddressBottomSheet: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delaySearch(text: searchText, action: #selector(delaySearch(with:)), afterDelay: 0.3)
    }

    @objc func delaySearch(with: String) {
        self.postRequest(searchText: with)
    }
}

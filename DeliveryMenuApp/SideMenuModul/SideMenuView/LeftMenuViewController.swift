//
//  LeftMenuViewController.swift
//  Restaurant
//
//  Created by Иван Пономарев on 27.01.2023.
//

import Foundation
import UIKit

protocol SideMenuViewProtocol: AnyObject {
    var presenter: SideMenuPresenterProtocol? { get set }
    func reloadCell()
    func userSetup(user: UserModel)
}

final class LeftMenuViewController: UIViewController {
    var presenter: SideMenuPresenterProtocol?

    private let avatarImage: UIImageView = {
        let avatarImage = UIImageView()
        avatarImage.clipsToBounds = true
        avatarImage.layer.cornerRadius = 30
        return avatarImage
    }()

    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = FontContants.sfPromedium16
        return nameLabel
    }()

    private let numberLabel: UILabel = {
        let numberLabel = UILabel()
        numberLabel.font = FontContants.sfRegular16
        return numberLabel
    }()

    private let seporator: UILabel = {
        let seporatop = UILabel()
        seporatop.backgroundColor = ColorConstants.seporatopColor
        return seporatop
    }()

    private let paymentlabel: UILabel = {
        let paymentlabel = UILabel()
        paymentlabel.text = "Оплата"
        paymentlabel.font = FontContants.sfRegular16
        return paymentlabel
    }()

    private let cartNumberlabel: UILabel = {
        let cartNumberlabel = UILabel()
        cartNumberlabel.text = "Карта *4567"
        cartNumberlabel.font = FontContants.sfRegular14
        cartNumberlabel.textColor = ColorConstants.greyText
        return cartNumberlabel
    }()

    private let menuTableView = UITableView()

    private let connectButton: UIButton = {
        let connectButton = UIButton()
        connectButton.setImage(UIImage(named: "connect"), for: .normal)
        connectButton.layer.borderColor = ColorConstants.borderColor
        connectButton.layer.borderWidth = 2
        connectButton.layer.cornerRadius = 27
        return connectButton
    }()

    private let connectionLabel: UILabel = {
        let connectionLabel = UILabel()
        connectionLabel.textColor = ColorConstants.greyText
        connectionLabel.text = "Связаться с нами"
        connectionLabel.font = FontContants.sfRegular16
        connectionLabel.numberOfLines = 2
        return connectionLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConnectButton()
        setupUI()
        setupMenuTableView()
        getCell()
        getUser()
    }

    func getUser() {
        presenter?.getUser()
    }

    func getCell() {
        presenter?.getModel()
    }

    private func setupConnectButton() {
        connectButton.imageEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        connectButton.addTarget(self, action: #selector(tappedConnectButton), for: .touchUpInside)
    }

    @objc func tappedConnectButton() {
        print("tapped connect button")
    }

    private func setupMenuTableView() {
        menuTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.separatorStyle = .none
        menuTableView.rowHeight = 50
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(avatarImage)
        avatarImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.left.equalToSuperview().inset(15)
            make.height.width.equalTo(57)
        }

        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(avatarImage.snp.right).inset(-30)
            make.bottom.equalTo(avatarImage.snp.centerY)
            make.width.equalTo(150)
            make.height.equalTo(20)
        }

        view.addSubview(numberLabel)
        numberLabel.snp.makeConstraints { make in
            make.left.equalTo(avatarImage.snp.right).inset(-30)
            make.top.equalTo(nameLabel.snp.bottom)
            make.width.equalTo(150)
            make.height.equalTo(20)
        }

        view.addSubview(seporator)
        seporator.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(numberLabel.snp.bottom).inset(-26)
            make.height.equalTo(2)
        }


        view.addSubview(paymentlabel)
        paymentlabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(18)
            make.width.equalTo(54)
            make.top.equalTo(seporator.snp.bottom).inset(-24)
            make.height.equalTo(20)
        }

        view.addSubview(cartNumberlabel)
        cartNumberlabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(18)
            make.width.equalTo(100)
            make.top.equalTo(paymentlabel.snp.bottom)
            make.height.equalTo(20)
        }

        view.addSubview(connectButton)
        connectButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(45)
            make.height.width.equalTo(52)
        }

        view.addSubview(connectionLabel)
        connectionLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(50)
            make.left.equalTo(connectButton.snp.right).inset(-8)
            make.height.equalTo(40)
            make.width.equalTo(100)
        }

        view.addSubview(menuTableView)
        menuTableView.snp.makeConstraints { make in
            make.top.equalTo(cartNumberlabel.snp.bottom).inset(-15)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(connectionLabel.snp.top).inset(-10)
        }
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension LeftMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.cellArray?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = presenter?.cellArray?[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(presenter?.cellArray?[indexPath.row] ?? "")
    }
}

extension LeftMenuViewController: SideMenuViewProtocol {
    func userSetup(user: UserModel) {
        avatarImage.image = user.avatar
        numberLabel.text = user.numberPhone
        nameLabel.text = user.name
    }
    
    func reloadCell() {
        menuTableView.reloadData()
    }
}

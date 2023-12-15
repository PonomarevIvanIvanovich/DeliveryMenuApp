//
//  LeftMenuViewController.swift
//  Restaurant
//
//  Created by Иван Пономарев on 27.01.2023.
//

import Foundation
import UIKit

final class LeftMenuViewController: UIViewController {
    let cellArray = ["Мои адреса", "Мои заказы", "Избранное", "Новости", "Купоны", "О нас", "Пригласить друзей", "Настройки"]

    private let avatarImage: UIImageView = {
        let avatarImage = UIImageView()
        avatarImage.clipsToBounds = true
        avatarImage.layer.cornerRadius = 30
        avatarImage.image = UIImage(named: "avatar")
        return avatarImage
    }()

    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Иван Иванов"
        nameLabel.font = FontContants.sfPromedium16
        return nameLabel
    }()

    private let numberLabel: UILabel = {
        let numberLabel = UILabel()
        numberLabel.text = "+7-912 011-11-33"
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

        view.addSubview(connectionLabel)
        connectionLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(150)
            make.height.equalTo(40)
            make.width.equalTo(100)
        }

        view.addSubview(menuTableView)
        menuTableView.snp.makeConstraints { make in
            make.top.equalTo(cartNumberlabel.snp.bottom).inset(-15)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(connectionLabel.snp.top)
        }

        view.addSubview(connectButton)
        connectButton.snp.makeConstraints { make in
            make.right.equalTo(connectionLabel.snp.left).inset(-15)
            make.bottom.equalToSuperview().inset(45)
            make.height.width.equalTo(52)
        }
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension LeftMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = cellArray[indexPath.row]
        return cell
    }
}

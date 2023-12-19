//
//  ContainerViewController.swift
//  Restaurant
//
//  Created by Иван Пономарев on 27.01.2023.
//

import Foundation
import UIKit

final class ContainerViewController: UIViewController, MainScreenViewControlerDelegate {
    private var controller = UIViewController()
    private var leftMenuViewController = LeftMenuViewController()
    private var isMove = false

    override func viewDidLoad() {
        super.viewDidLoad()
        configureMainScreenViewController()
        setupSwipeRecognizer()
    }

    private func setupSwipeRecognizer() {
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector (self.handleSwipeGesture))
        swipeRecognizer.direction = .left
        leftMenuViewController.view.addGestureRecognizer(swipeRecognizer)
    }

    @objc private func handleSwipeGesture(){
        toggleMenu()
    }

    private func configureMainScreenViewController() {
        let mainScreenViewController = MainScreenViewControler()
        mainScreenViewController.delegate = self
        controller = mainScreenViewController
        view.addSubview(controller.view)
        addChild(controller)
    }

    private func configureLeftMenuViewController() {
        view.insertSubview(leftMenuViewController.view, at: 0)
        addChild(leftMenuViewController)
    }

    private func showMenuViewController(shouldMove: Bool) {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0,
                       options: .curveEaseInOut,
                       animations: {
            if shouldMove {
                self.controller.view.frame.origin.x = self.controller.view.frame.width - 40
            } else {
                self.controller.view.frame.origin.x = 0
            }
        })
    }

    //MARK: - MainScreenViewControlerDelegate

    func toggleMenu() {
        configureLeftMenuViewController()
        isMove = !isMove
        showMenuViewController(shouldMove: isMove)
    }
}

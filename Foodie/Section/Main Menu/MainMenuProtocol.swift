//
//  MainMenuProtocol.swift
//  Foodie
//
//  Created by Nurul Mustika on 13/12/24.
//

import UIKit

protocol MainMenuViewToPresenterProtocol {
    var view: MainMenuPresenterToViewProtocol? {get set}
    var interactor: MainMenuPresenterToInteractorProtocol? {get set}
    var router: MainMenuPresenterToRouterProtocol? {get set}
    func viewdidLoad()
}

protocol MainMenuPresenterToViewProtocol {
    func setupTabBar(with viewControllers: [UIViewController])
}

protocol MainMenuPresenterToRouterProtocol {
    static func createModule() -> MainMenuViewController
}

protocol MainMenuPresenterToInteractorProtocol {
    var presenter: MainMenuInteractorToPresenterProtocol? {get set}
    func fetchTabBarItems()
}

protocol MainMenuInteractorToPresenterProtocol {
    func didFetchTabBarItems(_ items: [TabBarItem])
}



//
//  MainMenuPresenter.swift
//  Foodie
//
//  Created by Nurul Mustika on 12/12/24.
//

import UIKit

class MainMenuPresenter: MainMenuViewToPresenterProtocol {
    var view: MainMenuPresenterToViewProtocol?
    
    var interactor: MainMenuPresenterToInteractorProtocol?
    
    var router: MainMenuPresenterToRouterProtocol?
    
    func viewdidLoad() {
        interactor?.fetchTabBarItems()
    }
    
}

extension MainMenuPresenter: MainMenuInteractorToPresenterProtocol {
    func didFetchTabBarItems(_ items: [TabBarItem]) {
        let viewControllers = items.map { item -> UIViewController in
            let viewController = item.viewController
            viewController.tabBarItem = UITabBarItem(title: item.title, image: UIImage(systemName: item.iconName), tag: 0)
            return viewController
        }
        view?.setupTabBar(with: viewControllers)
    }
    
}

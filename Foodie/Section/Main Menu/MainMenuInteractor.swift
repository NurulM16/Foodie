//
//  MainMenuInteractor.swift
//  Foodie
//
//  Created by Nurul Mustika on 12/12/24.
//

import UIKit

struct TabBarItem {
    let title: String
    let iconName: String
    let viewController: UIViewController
}

class MainMenuInteractor: MainMenuPresenterToInteractorProtocol {
    var presenter: MainMenuInteractorToPresenterProtocol?

    func fetchTabBarItems() {
            let sbSecondVC = UIStoryboard(name: "Favorite", bundle: nil)
            let secondVC = sbSecondVC.instantiateViewController(withIdentifier: "FavoriteViewController")
        let items = [
            TabBarItem(title: "Recipe", iconName: "fork.knife.circle", viewController: SearchRecipesRouter.createModule()),
            TabBarItem(title: "Favorite", iconName: "calendar.circle", viewController: FavoriteRecipeRouter.createModule()),
        ]
        presenter?.didFetchTabBarItems(items)
    }
    
}

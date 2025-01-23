//
//  MainMenuController.swift
//  Foodie
//
//  Created by Nurul Mustika on 05/12/24.
//

import UIKit

class MainMenuViewController: UITabBarController, MainMenuPresenterToViewProtocol {
    
    var presenter: MainMenuViewToPresenterProtocol?
    
    override func viewDidLoad() {
        presenter?.viewdidLoad()
    }
    
    func setupTabBar(with listVC: [UIViewController]) {
        self.viewControllers = listVC
    }
    
}



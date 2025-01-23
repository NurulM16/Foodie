//
//  MainMenuRouter.swift
//  Foodie
//
//  Created by Nurul Mustika on 12/12/24.
//

import UIKit

class MainMenuRouter: MainMenuPresenterToRouterProtocol {
    static func createModule() -> MainMenuViewController {
        let view = MainMenuViewController.instantiate(fromStoryboardName: "Main")
        var presenter: MainMenuViewToPresenterProtocol & MainMenuInteractorToPresenterProtocol = MainMenuPresenter()
        var interactor: MainMenuPresenterToInteractorProtocol = MainMenuInteractor()
        let router: MainMenuPresenterToRouterProtocol = MainMenuRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
}

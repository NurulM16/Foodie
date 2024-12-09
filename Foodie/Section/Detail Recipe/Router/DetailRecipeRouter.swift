//
//  DetailRecipeRouter.swift
//  Foodie
//
//  Created by Nurul Mustika on 03/12/24.
//

import UIKit

class DetailRecipeRouter: DetailRecipePresenterToRouterProtocol {
    static func createModule() -> DetailRecipeViewController {
        let view = DetailRecipeViewController.instantiate()
        var presenter: DetailRecipeViewToPresenterProtocol & DetailRecipeInteractorToPresenterProtocol = DetailRecipePresenter()
        var interactor: DetailRecipePresenterToInteractorProtocol = DetailRecipeInteractor()
        let router: DetailRecipePresenterToRouterProtocol = DetailRecipeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        return view
    }
    
    
}

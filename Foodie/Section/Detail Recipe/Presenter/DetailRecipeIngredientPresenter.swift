//
//  DetailRecipeIngredientPresenter.swift
//  Foodie
//
//  Created by Nurul Mustika on 06/01/25.
//

import UIKit

protocol DetailRecipeIngredientPresenterToViewProtocol {
    func onSuccess(image: UIImage?)
    func fetchFailed(error: String)
    func isLoading(isLoading: Bool)
}

protocol DetailRecipeIngredientPresenterToRouterProtocol {
    static func createModule() -> IngredientViewController
}

protocol DetailRecipeIngredientPresenterToInteractorProtocol {
    var presenter: DetailRecipeIngredientInteractorToPresenterProtocol? {get set}
    func getIngredientImage(id: Int)
}

class DetailRecipeIngredientPresenter: DetailRecipeIngredientViewToPresenterProtocol {
    var view: DetailRecipeIngredientPresenterToViewProtocol?
    
    var interactor: DetailRecipeIngredientPresenterToInteractorProtocol?
    
    var router: DetailRecipeIngredientPresenterToRouterProtocol?
    
    func getIngredientImage(id: Int) {
        interactor?.getIngredientImage(id: id)
    }
    
}

extension DetailRecipeIngredientPresenter: DetailRecipeIngredientInteractorToPresenterProtocol {
    func onSuccess(image: UIImage?) {
        view?.onSuccess(image: image)
        print("view image \(String(describing: image))")
    }
    
    func fetchFailed(error: String) {
        view?.fetchFailed(error: error)
    }
    
    func isLoading(isLoading: Bool) {
        view?.isLoading(isLoading: isLoading)
    }
    
}



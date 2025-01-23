//
//  DetailRecipeNutritionPresenter.swift
//  Foodie
//
//  Created by Nurul Mustika on 15/01/25.
//

import UIKit

protocol DetailRecipeNutritionPresenterInput {
    var view: DetailRecipeNutritionPresenterOutput? {get set}
    var interactor: DetailRecipeNutritionInteractorInput? {get set}
    var router: DetailRecipeNutritionRouterProtocol? {get set}
    func viewDidLoad(id: Int)
}
protocol DetailRecipeNutritionPresenterOutput {
    func showImage(image: UIImage?)
    func showError(message: String)
    func showLoading(isLoading: Bool)
}

class DetailRecipeNutritionPresenter: DetailRecipeNutritionPresenterInput {
    var view: DetailRecipeNutritionPresenterOutput?
    
    var interactor: DetailRecipeNutritionInteractorInput?
    
    var router: DetailRecipeNutritionRouterProtocol?
    
    func viewDidLoad(id: Int) {
        interactor?.fetchNutritionImage(id: id)
    }

}

extension DetailRecipeNutritionPresenter: DetailRecipeNutritionInteractorOutput {
    func onSuccess(image: UIImage?) {
        view?.showImage(image: image)
    }
    
    func fetchFailed(message: String) {
        view?.showError(message: "Failed to show image")
    }
    
    func isLoading(isLoading: Bool) {
        view?.showLoading(isLoading: isLoading)
    }
    
}

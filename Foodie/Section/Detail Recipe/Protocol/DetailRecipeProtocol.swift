//
//  DetailRecipeProtocol.swift
//  Foodie
//
//  Created by Nurul Mustika on 03/12/24.
//

import Foundation

protocol DetailRecipeViewToPresenterProtocol {
    var view: DetailRecipePresenterToViewProtocol? {get set}
    var interactor: DetailRecipePresenterToInteractorProtocol? {get set}
    var router: DetailRecipePresenterToRouterProtocol? {get set}
    func getRecipeInformation(id: Int)
    
}

protocol DetailRecipePresenterToViewProtocol {
    func onSuccess(data: GetRecipeInformationResponse?)
    func fetchFailed(error: String)
    func isLoading(isLoading: Bool)
}

protocol DetailRecipePresenterToRouterProtocol {
    static func createModule() -> DetailRecipeViewController
}

protocol DetailRecipePresenterToInteractorProtocol {
    var presenter: DetailRecipeInteractorToPresenterProtocol? {get set}
    func getRecipeInformation(id: Int)
}

protocol DetailRecipeInteractorToPresenterProtocol {
    func onSuccess(data: GetRecipeInformationResponse?)
    func fetchFailed(error: String)
    func isLoading(isLoading: Bool)
}

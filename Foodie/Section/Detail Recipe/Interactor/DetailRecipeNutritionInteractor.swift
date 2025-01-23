//
//  DetailRecipeNutritionInteractor.swift
//  Foodie
//
//  Created by Nurul Mustika on 15/01/25.
//

import UIKit
import RxSwift

protocol DetailRecipeNutritionInteractorInput {
    var presenter: DetailRecipeNutritionInteractorOutput? {get set}
    func fetchNutritionImage(id: Int)
}

protocol DetailRecipeNutritionInteractorOutput {
    func onSuccess(image: UIImage?)
    func fetchFailed(message: String)
    func isLoading(isLoading: Bool)
}

class DetailRecipeNutritionInteractor: DetailRecipeNutritionInteractorInput {
    var presenter: DetailRecipeNutritionInteractorOutput?
    private let service: NetworkManager
    let disposeBag = DisposeBag()
    
    init(service: NetworkManager = NetworkManager()) {
        self.service = service
    }
    func fetchNutritionImage(id: Int) {
        service.fetchNutritionLabelImage(id: id)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onSuccess: { [weak self] image in
                    guard let self = self else { return }
                    self.presenter?.onSuccess(image: image)
                    self.presenter?.isLoading(isLoading: false)
                },
                onFailure: { [weak self] error in
                    guard let self = self, let apiError = error as? APIError else { return }
                    self.presenter?.fetchFailed(message: apiError.message)
                    self.presenter?.isLoading(isLoading: false)
                }
            )
            .disposed(by: disposeBag)
    }
    

}

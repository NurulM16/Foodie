//
//  DetailRecipeIngredientInteractor.swift
//  Foodie
//
//  Created by Nurul Mustika on 06/01/25.
//

import UIKit
import RxSwift

protocol DetailRecipeIngredientInteractorToPresenterProtocol {
    func onSuccess(image: UIImage?)
    func fetchFailed(error: String)
    func isLoading(isLoading: Bool)
}

class DetailRecipeIngredientInteractor: DetailRecipeIngredientPresenterToInteractorProtocol {
    
    var presenter: DetailRecipeIngredientInteractorToPresenterProtocol?
    
    private let service: NetworkManager
    let disposeBag = DisposeBag()
    
    init(service: NetworkManager = NetworkManager()) {
        self.service = service
    }
    
    func getIngredientImage(id: Int) {
        service.fetchIngredientImage(id: id)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onSuccess: { [weak self] image in
                    guard let self = self else { return }
                    self.presenter?.onSuccess(image: image)
                    self.presenter?.isLoading(isLoading: false)
                },
                onFailure: { [weak self] error in
                    guard let self = self, let apiError = error as? APIError else { return }
                    self.presenter?.fetchFailed(error: apiError.message)
                    self.presenter?.isLoading(isLoading: false)
                }
            )
            .disposed(by: disposeBag)
    }
}

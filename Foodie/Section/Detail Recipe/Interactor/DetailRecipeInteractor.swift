//
//  DetailRecipeInteractor.swift
//  Foodie
//
//  Created by Nurul Mustika on 03/12/24.
//

import Foundation
import RxSwift

class DetailRecipeInteractor: DetailRecipePresenterToInteractorProtocol {
    var presenter: DetailRecipeInteractorToPresenterProtocol?
    private let service: NetworkManager
    let disposeBag = DisposeBag()
    
    init(service: NetworkManager = NetworkManager()) {
        self.service = service
    }
    
    func getRecipeInformation(id: Int) {
        presenter?.isLoading(isLoading: true)
        service.fetchRecipeInformation(id: id)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onSuccess: { [weak self] tasks in
                    guard let self = self else { return }
                    self.presenter?.onSuccess(data: tasks)
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

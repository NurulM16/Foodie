//
//  SearchRecipesInteractor.swift
//  Foodie
//
//  Created by Nurul Mustika on 29/11/24.
//
import Foundation
import RxSwift

class SearchRecipesInteractor: SearchRecipesPresenterToInteractorProtocol {
    var presenter: SearchRecipesInteractorToPresenterProtocol?
    private let service: NetworkManager
    let disposeBag = DisposeBag()
    
    init(service: NetworkManager = NetworkManager()) {
        self.service = service
    }
    
    func searchRecipes(query: String) {
        presenter?.isLoading(isLoading: true)
        
        service.fetchSearchRecipes(query: query)
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
    
//    func startFetchingsearchRecipes() {
//        service.fetchSearchRecipes()
//            .observe(on: MainScheduler.instance)
//            .asObservable()
//            .trackLoading { [weak self] isLoading in
//                self?.presenter?.isLoading(isLoading: isLoading)
//            }
//            .subscribe(
//                onNext: { [weak self] tasks in
//                    self?.presenter?.onSuccess(data: tasks)
//                },
//                onError: { [weak self] error in
//                    guard let self = self, let apiError = error as? APIError else { return }
//                    self.presenter?.fetchFailed(error: apiError.message)
//                }
//            )
//            .disposed(by: disposeBag)
//    }

    
    
}

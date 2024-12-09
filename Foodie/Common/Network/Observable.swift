//
//  Observable.swift
//  Foodie
//
//  Created by Nurul Mustika on 29/11/24.
//

import RxSwift

extension ObservableType {
    func trackLoading(_ isLoading: @escaping (Bool) -> Void) -> Observable<Element> {
        return self.do(
            onSubscribe: { isLoading(true) },
            onDispose: { isLoading(false) }
        )
    }
}

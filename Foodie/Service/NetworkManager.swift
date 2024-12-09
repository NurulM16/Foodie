//
//  NetworkManager.swift
//  Foodie
//
//  Created by Nurul Mustika on 26/11/24.
//

import RxSwift
import Moya

protocol FetchApiServices {
    func fetchSearchAllFood() -> Single<SearchAllFoodResponse?>
}

final class NetworkManager: FetchApiServices {
    private let provider = MoyaProvider<NetworkService>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: [.requestBody, .successResponseBody, .errorResponseBody]))])
    
    func request<T: Codable>(networkService: NetworkService) -> Single<T?> {
        if !Reachability.isConnectedToNetwork() {
            return Single.error(APIError(with: .internetConnection, message: "No Internet Connection"))
        }
        
        return provider.rx.request(networkService).observe(on: ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))).catch { error -> PrimitiveSequence<SingleTrait, Response> in
            return Single.error(APIError(with: .unknown, message: error.localizedDescription))
        }.flatMap { json -> Single<T?> in
            if json.statusCode >= 200 && json.statusCode <= 300 {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                if let response = try? decoder.decode(T.self, from: json.data) {
                    return Single.just(response)
                }
            } else {
                let error = APIError(with: .internalServerError, message: "Internal Server Error")
                return Single.error(error)
            }
            let error = APIError(with: .unknown, message: "Failed to parse response")
            return Single.error(error)
        }
    }
    
    func fetchSearchAllFood() -> Single<SearchAllFoodResponse?> {
        return request(networkService: .searchAllFood)
    }
    
    func fetchSearchRecipes(query: String) -> Single<SearchRecipesResponse?> {
        return request(networkService: .searchRecipes(query: query))
    }
    
    func fetchRecipeInformation(id: Int) -> Single<GetRecipeInformationResponse?> {
        return request(networkService: .getRecipeInformation(id: id))
    }
    
 
}

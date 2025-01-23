//
//  NetworkManager.swift
//  Foodie
//
//  Created by Nurul Mustika on 26/11/24.
//

import RxSwift
import Moya
import Kingfisher

protocol FetchApiServices {
    func fetchSearchAllFood() -> Single<SearchAllFoodResponse?>
}

final class HeaderDebugPlugin: PluginType {
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        print("Headers: \(request.allHTTPHeaderFields ?? [:])")
        return request
    }
}

final class NetworkManager: FetchApiServices {
//    private let provider = MoyaProvider<NetworkService>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: [.requestBody, .successResponseBody, .errorResponseBody]))])
    private let provider = MoyaProvider<NetworkService>(plugins: [HeaderDebugPlugin()])
    
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
    
    func requestImage(networkService: NetworkService) -> Single<UIImage?> {
        guard Reachability.isConnectedToNetwork() else {
            return .error(APIError(with: .internetConnection, message: "No Internet Connection"))
        }
        
        return Single.create { single in
            self.provider.request(networkService) { result in
                switch result {
                case .success:
                    guard let url = URL(string: "\(networkService.baseURL)\(networkService.path)?apiKey=\(apiKey)") else {
                        single(.failure(APIError(with: .invalidURL, message: "Invalid URL")))
                        return
                    }
                    KingfisherManager.shared.retrieveImage(with: url) { imageResult in
                        switch imageResult {
                        case .success(let value): single(.success(value.image))
                        case .failure(let error): single(.failure(APIError(with: .unknown, message: error.localizedDescription)))
                        }
                    }
                case .failure(let error):
                    single(.failure(APIError(with: .unknown, message: error.localizedDescription)))
                }
            }
            return Disposables.create()
        }
    }
    
    func fetchSearchAllFood() -> Single<SearchAllFoodResponse?> {
        return request(networkService: .searchAllFood)
    }
    
    func fetchSearchRecipes(query: String) -> Single<SearchRecipesResponse?> {
        return request(networkService: .searchRecipes(query: query, number: 100))
    }
    
    func fetchRecipeInformation(id: Int) -> Single<GetRecipeInformationResponse?> {
        return request(networkService: .getRecipeInformation(id: id))
    }
    
    func fetchIngredientImage(id: Int) -> Single<UIImage?> {
        return requestImage(networkService: .getIngredientImage(id: id))
    }
    
    func fetchNutritionLabelImage(id: Int) -> Single<UIImage?> {
        return requestImage(networkService: .getNutritionLabelImage(id: id))
    }
 
}

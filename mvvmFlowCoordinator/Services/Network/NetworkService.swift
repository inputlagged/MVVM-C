//
//  PersistenceService.swift
//  mvvmFlowCoordinator
//
//  Created by inputlagged on 10/11/22.
//

import Foundation
import ObjectMapper

protocol NetworkServiceProtocol {
    func fetchBreeds(params: BreedURLParameters, completion: @escaping (Result<[Breed], Error>) -> Void)
}

internal struct NetworkService {
    internal func baseRequest<T: Mappable>(request: URLRequest, completion: @escaping (Result<[T], Error>) -> Void) {
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                let model = Mapper<T>().mapArray(JSONString: jsonString)
                completion(.success(model!))
            }
            
        }.resume()
    }
}

extension NetworkService: NetworkServiceProtocol {
    func fetchBreeds(params: BreedURLParameters, completion: @escaping (Result<[Breed], Error>) -> Void) {
        let request = URLFactory.getBreedsRequest(params: params)
        self.baseRequest(request: request, completion: completion)
    }
}

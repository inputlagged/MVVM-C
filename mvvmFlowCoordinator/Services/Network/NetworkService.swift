//
//  PersistenceService.swift
//  mvvmFlowCoordinator
//
//  Created by inputlagged on 10/11/22.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchCharacters(page: Int, completion: @escaping (Result<ResponseInfo, Error>) -> Void)
}

internal struct NetworkService {
    internal func baseRequest<T: Decodable>(url: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            
            let decoder = JSONDecoder()
            do {
                let decodedModel = try decoder.decode(T.self, from: data)
                completion(.success(decodedModel))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}

extension NetworkService: NetworkServiceProtocol {
    func fetchCharacters(page: Int, completion: @escaping (Result<ResponseInfo, Error>) -> Void) {
        self.baseRequest(url: "https://swapi.dev/api/people/?page=\(page)", completion: completion)
    }
}

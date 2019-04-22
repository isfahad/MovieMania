//
//  NetworkTask.swift
//  MovieMania
//
//  Created by Fahad Shaikh on 21/04/19.
//  Copyright © 2019 Fahad Shaikh. All rights reserved.
//
import Foundation

class NetworkTask {
    
    func fetch(_ resource: Resource, result: @escaping ((Result<Data>) -> Void)) {
        let request = URLRequest(resource)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let `data` = data else {
                result(.failure(APIClientError.noData))
                return
            }
            if let `error` = error {
                result(.failure(error))
                return
            }
            result(.success(data))
        }
       task.resume()
    }
    
    func fetch<T:Decodable>(_ resource: Resource, result: @escaping ((Result<T>) -> Void)) {
        self.fetch(resource) { dataResult in
            switch dataResult{
            case .failure(let error):
                result(.failure(error))
                return
            case .success(let data):
                if let responseObject = try? JSONDecoder().decode(T.self, from: data) {
                    result(.success(responseObject))
                    return
                }
            }
        }
    }
}

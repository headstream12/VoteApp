//
//  NetworkService.swift
//  VoteApp
//
//  Created by Ilya Glazunov on 5/3/19.
//  Copyright © 2019 Ilya Glazunov. All rights reserved.
//

import Foundation

class NetworkService {
    func buildRequest(_ urlString: String, parameters: [String: Any?]) -> URLRequest? {
        guard let url = URL(string: urlString) else { return nil }
       
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.timeoutInterval = 20
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        
        if parameters.count > 0 {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        }
        
        return request
    }
    
    func send<T: Decodable>(rawUrl: String, parameters: [String: Any?], completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let request = buildRequest(rawUrl, parameters: parameters) else {
            completion(.failure(NSError()))
            
            return
        }
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                let result = self.decode(data: data, response: response, err: error) as T?
                if result != nil {
                    completion(.success(result!))
                } else {
                    completion(.failure(error ?? NSError()))
                }
            }
        }
    }
    
    private func decode<T: Decodable>(data: Data?, response: URLResponse?, err: Error?) -> T? {
        guard let realData = data else {
            return nil
        }
        do {
            let result = try JSONDecoder().decode(T.self, from: realData)
            return result
            
        } catch {
            
            print(error)
            return nil
        }
    }
}

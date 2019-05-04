//
//  VotingAPI.swift
//  VoteApp
//
//  Created by Ilya Glazunov on 5/4/19.
//  Copyright © 2019 Ilya Glazunov. All rights reserved.
//

import Foundation

class VotingAPI {
    private let networkService = NetworkService()
    
    func getPublicKey(completion: @escaping (Result<VotingEntity, Error>) -> Void) {
        networkService.send(rawUrl: "http://192.168.0.107:5000/v1/getAdverts", parameters: [:], responseType: VotingEntity.self) { result in
            switch result {
            case .success(let votingEntity):
                completion(.success(votingEntity))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func sendNumber(encryptedNumber: String, completion: @escaping (Result<SendStatus, Error>) -> Void) {
        networkService.send(rawUrl: "http://192.168.0.107:5000/sendNumber", parameters: ["number": encryptedNumber], responseType: SendStatus.self) { result in
            switch result {
            case .success(let votingEntity):
                completion(.success(votingEntity))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

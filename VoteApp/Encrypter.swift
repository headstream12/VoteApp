//
//  Encryption.swift
//  VoteApp
//
//  Created by Ilya Glazunov on 4/21/19.
//  Copyright © 2019 Ilya Glazunov. All rights reserved.
//

import Foundation

class Encrypter {
    func encrypt(_ number: BigUInt, g: String, publicKey: String, completion: @escaping (BigUInt) -> Void) {
        DispatchQueue.global(qos: .userInteractive).async {
            print("encrypt in processing")
            let x: BigUInt = BigUInt.randomInteger(withExactWidth: 2^1024)
            let g: BigUInt = BigUInt(stringLiteral: g)
            let N: BigUInt = BigUInt(stringLiteral: publicKey)
            let e: BigUInt = (g.power(number, modulus: N.power(2))*x.power(N, modulus: N.power(2))) % N.power(2)
            DispatchQueue.main.async {
                print("finish encrypt")
                completion(e)
            }
        }
    }
}

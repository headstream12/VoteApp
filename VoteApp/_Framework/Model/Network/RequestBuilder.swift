//
//  RequestBuilder.swift
//  VoteApp
//
//  Created by Ilya Glazunov on 5/3/19.
//  Copyright © 2019 Ilya Glazunov. All rights reserved.
//

import Foundation

class RequestBuilder {
    
    enum HttpMethod: String {
        case get, post
    }
    
    private var baseURL: String
    private var version: Int
    private var token: String?
    
    private var path: String!
    private var parameters: [String: Any?] = [:]
    private var method: HttpMethod?
    private var header: [String: String] = ["Content-Type": "application/json", "X-Device-Platform": "iOS"]
    
    internal func path(_ path: String) -> RequestBuilder {
        self.path = path
        return self
    }
    
    internal func httpMethod(_ method: HttpMethod) -> RequestBuilder {
        self.method = method
        return self
    }
    
    internal func parameters(_ parameters: [String: Any?]) -> RequestBuilder {
        self.parameters = parameters
        return self
    }
    
    internal func addHeader(_ header: [String: String]) -> RequestBuilder {
        for (key, value) in header {
            self.header[key] = value
        }
        return self
    }
    
    func build() -> URLRequest? {

        guard let method = self.method else { return nil }

        var rawURL = "\(baseURL)/v\(version)"

        if let path = self.path {
            rawURL += "/\(path)"
        }

        if let token = self.token {
            parameters.updateValue(token, forKey: "token")
            print(token)
        }

        if parameters.count > 0, method == .get {
            var strparams: [String] = []
            for (k, v) in parameters {
                let sparam = "\(k)=\(String(describing: v))"
                strparams.append(sparam)
            }
            rawURL += "?\(strparams.joined(separator: "&"))"
        }

        guard let url = URL(string: rawURL) else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue.uppercased()
        request.timeoutInterval = 20
        request.allHTTPHeaderFields = self.header
        if parameters.count > 0, method == .post {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        }

        return request
    }
    
    init(baseURL: String, version: Int, token: String?) {
        self.baseURL = baseURL
        self.token = token
        self.version = version
    }
}

extension RequestBuilder {
    
    func multipartRequest(path: String, boundary: String) -> URLRequest? {
        let rawURL = "\(baseURL)/v\(version)/\(path)"
        guard let url = URL(string: rawURL) else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        urlRequest.allHTTPHeaderFields = ["X-Device-Platform": "iOS"]
        return urlRequest
    }
}

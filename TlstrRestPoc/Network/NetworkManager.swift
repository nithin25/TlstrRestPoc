//
//  NetworkManager.swift
//  TlstrRestPoc
//
//  Created by Nithin Kumar on 15/06/2019.
//  Copyright © 2019 Nithin Kumar. All rights reserved.
//

import Foundation

public enum Response<Success, Failure> where Failure : Error {
    case success(Success)
    case failure(Failure)
}

enum NetworkError: Error {
    case decodingError
    case domainError
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

struct Resource<T: Codable> {
    let url: URL
    var httpMethod: HttpMethod = .get
    var body: Data? = nil
}

extension Resource {
    init(url: URL) {
        self.url = url
    }
}

class NetworkManager {
    func fetch<T>(resource: Resource<T>, completion:@escaping (Response<T, NetworkError>) -> Void) {
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    completion(.failure(.domainError))
                    return
                }
            
                guard let responseString = String(data: data, encoding: .isoLatin1),
                    let responseData = responseString.data(using: .utf8) else {
                        completion(.failure(.domainError))
                        return
                }
            
                let result = try? JSONDecoder().decode(T.self, from: responseData)
                if let result = result {
                    DispatchQueue.main.async {
                        completion(.success(result))
                    }
                } else {
                    completion(.failure(.decodingError))
                }
            
            }.resume()
    }
}

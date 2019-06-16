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
    /**
     Fetch Json from the giver url.
     Parse to the model provided using Codable protocol.
     return parsed model object or error via completion handler with success or Failure parameters.
     
     - Parameter resource: OBject of type **Resource** which hold url and othe request details.
     - Parameter completion: completion handler which returns Success or Failure of the request.
     */
    func fetch<T>(resource: Resource<T>, completion:@escaping (Response<T, NetworkError>) -> Void) {
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    DispatchQueue.main.async {
                        completion(.failure(.domainError))
                    }
                    return
                }
            
                guard let responseString = String(data: data, encoding: .isoLatin1),
                    let responseData = responseString.data(using: .utf8) else {
                        DispatchQueue.main.async {
                            completion(.failure(.domainError))
                        }
                        return
                }
            
                let result = try? JSONDecoder().decode(T.self, from: responseData)
                DispatchQueue.main.async {
                    if let result = result {
                        completion(.success(result))
                    } else {
                        completion(.failure(.decodingError))
                    }
                }
            }.resume()
    }
}

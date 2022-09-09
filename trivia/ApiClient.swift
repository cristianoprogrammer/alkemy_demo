//
//  ApiClient.swift
//  trivia
//
//  Created by Cristiano Douglas on 08/09/22.
//

import Foundation
import Alamofire

class ApiClient {
    
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        AF.request(url).response { response in
            completion(response.result)
        }
    }
    
    func post(url: String, parameters: [String: Any], completion: @escaping (Result<Data?, AFError>) -> Void) {
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).response { response in
            completion(response.result)
        }
    }
    
}

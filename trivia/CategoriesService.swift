//
//  CategoriesService.swift
//  trivia
//
//  Created by Cristiano Douglas on 08/09/22.
//

import Foundation
import Alamofire

class CategoriesService {
    
    private static let CATEGORIES_URL = "https://opentdb.com/api_category.php"
    
    private struct Categories : Codable {
        
        var trivia_categories : [Category]
        
    }
    
    private let apiClient = ApiClient()
    
    func getCategories(completion: @escaping ([Category]) -> Void) {
        
        apiClient.get(url: CategoriesService.CATEGORIES_URL) { result in
            
            switch result {
            case .success(let data):
                do {
                    if let data = data {
                        let categories = try JSONDecoder().decode(Categories.self, from: data)
                        completion(categories.trivia_categories)
                    }
                } catch {
                    completion([])
                }
            case .failure( _ ):
                completion([])
            }
            
        }
        
    }
    
    func createCategory(id: Int, name: String, completion: @escaping (String) -> Void) {
        
        let parameters : [String:String] = ["id": String(id), "name" : name]
        apiClient.post(url: CategoriesService.CATEGORIES_URL, parameters: parameters) { result in
            switch result {
            case .success( _ ):
                completion("Categoria criada com sucess!")
            case .failure( _ ):
                completion("Falha ao criar categoria!")
            }
        }
    }
    
}

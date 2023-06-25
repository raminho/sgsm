//
//  APIManager.swift
//  Sara GSM
//
//  Created by Yousef on 6/24/23.
//

import Foundation

class APIManager {
    let baseURL = "http://yourwebsite.com/wp-json/wc/v3/"
    let consumerKey = "ck"
    let consumerSecret = "cs"
    
    func getCategories(completion: @escaping ([Category]?, Error?) -> Void) {
        guard let url = URL(string: "\(baseURL)products/categories?consumer_key=\(consumerKey)&consumer_secret=\(consumerSecret)") else {
            completion(nil, NSError(domain: "", code: -1, userInfo: nil))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            if let data = data {
                do {
                    let categories = try JSONDecoder().decode([Category].self, from: data)
                    completion(categories, nil)
                } catch let jsonError {
                    completion(nil, jsonError)
                }
            }
        }
        task.resume()
    }
}

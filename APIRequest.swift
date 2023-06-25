//
//  APIRequest.swift
//  Sara GSM
//
//  Created by Yousef on 6/24/23.
//

import Foundation


import Foundation

enum APIError: Error, LocalizedError {
    case unknown, apiError(reason: String), noDataAvailable, canNotProcessData

    var errorDescription: String? {
        switch self {
        case .unknown:
            return "Unknown error"
        case .apiError(let reason):
            return reason
        case .noDataAvailable:
            return "No data available"
        case .canNotProcessData:
            return "Cannot process the received data"
        }
    }
}

enum Endpoint: String {
    case categories = "categories"
    // other cases...
}

struct APIRequest {
    let resourceURL: URL
    let customerKey = "ck"
    let secretKey = "cs"

    init(endpoint: Endpoint) {
        let resourceString = "https://your website.com/wp-json/wc/v3/\(endpoint.rawValue)"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceURL
    }
    
    func getCategories(completion: @escaping (Result<[ProductCategory], APIError>) -> Void) {
        var request = URLRequest(url: resourceURL)
        request.httpMethod = "GET"
        request.setValue("Basic \(Data("\(customerKey):\(secretKey)".utf8).base64EncodedString())", forHTTPHeaderField: "Authorization")
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            do {
                let decoder = JSONDecoder()
                let categoriesResponse = try decoder.decode([ProductCategory].self, from: jsonData)
                let categoriesDetails = categoriesResponse
                completion(.success(categoriesDetails))
            } catch {
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
}

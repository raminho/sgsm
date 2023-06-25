//
//  CategoryViewModel.swift
//  Sara GSM
//
//  Created by Yousef on 6/24/23.
//

import Foundation
import SwiftUI

class CategoryViewModel: ObservableObject {
    @Published var categories = [ProductCategory]()
    @Published var isLoading = false

    func fetchCategories() {
        isLoading = true
        let apiRequest = APIRequest(endpoint: .categories)
        apiRequest.getCategories { [weak self] result in
            switch result {
            case .success(let categories):
                DispatchQueue.main.async {
                    self?.categories = categories
                    self?.isLoading = false
                }
            case .failure(let error):
                print("Error processing json data: \(error)")
            }
        }
    }
}

//
//  CategoryPageView.swift
//  Sara GSM
//
//  Created by Yousef on 6/24/23.
//


import SwiftUI

struct CategoryPageView: View {
    @ObservedObject var viewModel = CategoryViewModel()

    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView()
            } else {
                List {
                    ForEach(viewModel.categories, id: \.id) { category in
                        NavigationLink(destination: SubCategoryPageView(category: category)) {
                            Text(category.name)
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchCategories()
        }
    }
}

//
//  SubCategoryPageView.swift
//  Sara GSM
//
//  Created by Yousef on 6/24/23.
//
import SwiftUI

struct SubCategoryPageView: View {
    let category: ProductCategory

    var body: some View {
        List {
            ForEach(category.children ?? [], id: \.id) { subcategory in
                Text(subcategory.name)
            }
        }
        .navigationTitle(category.name)
    }
}

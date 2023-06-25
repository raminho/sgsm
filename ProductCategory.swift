//
//  ProductCategory.swift
//  Sara GSM
//
//  Created by Yousef on 6/25/23.
//

import Foundation

struct ProductCategory: Identifiable, Codable {
    let id: Int
    let name: String
    let parent: Int
    var children: [ProductCategory]?
}

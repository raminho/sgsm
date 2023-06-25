//
//  Models.swift
//  Sara GSM
//
//  Created by Yousef on 6/24/23.
//


struct Image: Codable {
    let src: String
}
struct Category: Codable {
    let id: Int
    let name: String
    let slug: String
    let image: Image
}

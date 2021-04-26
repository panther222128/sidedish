//
//  Product.swift
//  SidedishApp
//
//  Created by Jun Ho JANG on 2021/04/19.
//

import UIKit

struct Dish: Hashable, Codable {
    let uuid = UUID()
    
    let detailHash: String
    let image: String
    let alt: String
    let deliveryType: [String]
    let title: String
    let description: String
    let normalPrice: String?
    let salePrice: String
    let eventBadge: [String]?
    
    enum CodingKeys: String, CodingKey {
        case detailHash = "detail_hash"
        case image, alt
        case deliveryType = "delivery_type"
        case title, description
        case normalPrice = "n_price"
        case salePrice = "s_price"
        case eventBadge = "badge"
    }
}

struct Dishes: Decodable {
    let statusCode: Int
    let body: [Dish]
}

//
//  DetailDish.swift
//  SidedishApp
//
//  Created by Lia on 2021/04/28.
//

import Foundation

struct DetailDishes: Decodable {
    var statusCode: Int
    var body: [Detail]
}

struct Detail: Decodable {
    var hash: String
    var data: DetailDish
}

struct DetailDish: Hashable, Codable {
    let uuid = UUID()
    
    let topImage: String
    let thumbImage: [String]
    let productDescription: String
    let point: String
    let deliveryInfo: String
    let deliveryFee: String
    let price: [String]
    let detailSection: [String]
    
    enum CodingKeys: String, CodingKey {
        case topImage = "top_image"
        case thumbImage = "thumb_image"
        case productDescription = "product_description"
        case point
        case deliveryInfo = "delivery_info"
        case deliveryFee = "delivery_fee"
        case price
        case detailSection = "detail_section"
    }
}

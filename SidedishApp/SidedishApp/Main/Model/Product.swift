//
//  Product.swift
//  SidedishApp
//
//  Created by Jun Ho JANG on 2021/04/19.
//

import UIKit

struct Product: Hashable {
    let detailHash: String
    let image: String
    let alt: String
    let deliveryType: [String]
    let title: String
    let description: String
    let normalPrice: String
    let salePrice: String
    let eventBadge: [String]
}

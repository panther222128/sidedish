//
//  ProductModel.swift
//  SidedishApp
//
//  Created by Jun Ho JANG on 2021/04/19.
//

import UIKit

struct ProductModel: Hashable {
    let image: UIImage
    let name: String
    let description: String
    let price: String
    let discountedPrice: String
    let eventBadge: String
}

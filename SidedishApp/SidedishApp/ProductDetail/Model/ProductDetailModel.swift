//
//  ProductDetail.swift
//  SidedishApp
//
//  Created by Jun Ho JANG on 2021/04/20.
//

import UIKit

struct ProductDetailDescription {
    
    let image: UIImage
    let name: String
    let subdescription: String
    let price: String
    let discountedPrice: String
    let eventBadge: String
    
    init(image: UIImage, name: String, subdescription: String, discountedPrice: String, price: String, eventBadge: String) {
        self.image = image
        self.name = name
        self.subdescription = subdescription
        self.discountedPrice = discountedPrice
        self.price = price
        self.eventBadge = eventBadge
    }
    
}

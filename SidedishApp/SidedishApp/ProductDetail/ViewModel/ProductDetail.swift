//
//  ProductDetailViewModel.swift
//  SidedishApp
//
//  Created by Jun Ho JANG on 2021/04/20.
//

import UIKit

struct ProductDetail {
    
    private var product = [ProductDetailDescription]()

    init() {
        fetchProductData()
    }
    
    mutating func fetchProductData() {
        if let image = UIImage(named: "무야호.jpg") {
            product.append(ProductDetailDescription(image: image, name: "상품이름", subdescription: "상품설명", discountedPrice: "할인가격", price: "가격", eventBadge: "이벤트특가"))
        }
    }
    
    var productDetailData: [ProductDetailDescription] {
        return product
    }
    
}

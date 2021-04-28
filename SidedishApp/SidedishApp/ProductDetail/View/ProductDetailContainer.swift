//
//  ProductDetailContainer.swift
//  SidedishApp
//
//  Created by Jun Ho JANG on 2021/04/22.
//

import UIKit

class ProductDetailContainer: UIView {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var discountedPriceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var eventBadgeLabel: UILabel!
    
    // when cell didSelect -> give Dish_info (get label info & hash)
    func updateLabels(with product: Dish) {
        self.nameLabel.text = product.title
        self.descriptionLabel.text = product.description
        self.priceLabel.text = product.salePrice
        self.discountedPriceLabel.text = product.normalPrice ?? ""
        guard product.eventBadge?.count != 0, let eventBadge = product.eventBadge?[0] else {
            return
        }
        self.eventBadgeLabel.text = eventBadge
    }
    
}

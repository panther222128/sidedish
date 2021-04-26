//
//  DishCell.swift
//  SidedishApp
//
//  Created by Lia on 2021/04/20.
//

import UIKit

class DishCell: UICollectionViewCell {

    static let reuseIdentifier = "DishCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var discountedPriceLabel: UILabel!
    @IBOutlet weak var eventBadgeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fill(with product: Dish) {
        self.nameLabel.text = product.title
        self.descriptionLabel.text = product.description
        self.priceLabel.text = product.salePrice
    }

}

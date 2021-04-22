//
//  ProductCell.swift
//  SidedishApp
//
//  Created by Lia on 2021/04/20.
//

import UIKit

class DishCell: UICollectionViewCell {

    static let identifier = "ProductCell"
    
    @IBOutlet weak var image: UIImage!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var discountedPriceLabel: UILabel!
    @IBOutlet weak var eventBadgeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

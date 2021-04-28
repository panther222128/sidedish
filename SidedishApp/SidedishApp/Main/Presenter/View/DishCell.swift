//
//  DishCell.swift
//  SidedishApp
//
//  Created by Lia on 2021/04/20.
//

import UIKit

class DishCell: UICollectionViewCell {

    static let reuseIdentifier = "DishCell"

    static let nib : UINib = UINib(nibName: DishCell.reuseIdentifier, bundle: nil)
    
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
        DispatchQueue.main.async {
            self.convert(imageUrlString: product.image) { uiimage in
                self.imageView.image = uiimage
            }
        }
        
        self.nameLabel.text = product.title
        self.descriptionLabel.text = product.description
        self.priceLabel.text = product.salePrice
        self.discountedPriceLabel.text = product.normalPrice ?? ""
        guard product.eventBadge?.count != 0, let eventBadge = product.eventBadge?[0] else {
            return
        }
        self.eventBadgeLabel.text = eventBadge
    }
    
    private func convert(imageUrlString: String, handler: @escaping (UIImage) ->()) {
        guard let url = URL(string: imageUrlString) else { return }
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url)
        print("이미지 로드")
         handler(UIImage(data: data!) ?? UIImage())
        }
    }

}

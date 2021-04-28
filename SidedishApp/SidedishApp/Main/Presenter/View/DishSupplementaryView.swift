//
//  DishSupplementaryView.swift
//  SidedishApp
//
//  Created by Lia on 2021/04/27.
//

import UIKit

class DishSupplementaryView: UICollectionReusableView {

    static let reuseIdentifier = "DishSupplementaryView"
    static let nib = UINib(nibName: DishSupplementaryView.reuseIdentifier, bundle: nil)
    
    @IBOutlet weak var sectionTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

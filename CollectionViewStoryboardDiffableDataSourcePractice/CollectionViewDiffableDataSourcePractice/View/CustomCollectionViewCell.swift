//
//  CustomCollectionViewCell.swift
//  CollectionViewDiffableDataSourcePractice
//
//  Created by Jun Ho JANG on 2021/04/19.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CustomCellReuseIdentifier"
    
    @IBOutlet weak var memberImage: UIImageView!
    @IBOutlet weak var memberName: UILabel!
    @IBOutlet weak var memberRole: UILabel!
    @IBOutlet weak var memberNickname: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

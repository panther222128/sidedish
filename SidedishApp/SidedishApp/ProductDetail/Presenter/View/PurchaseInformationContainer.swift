//
//  DeliveryConditionContainer.swift
//  SidedishApp
//
//  Created by Jun Ho JANG on 2021/04/22.
//

import UIKit

class PurchaseInformationContainer: UIView {
    
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var deliveryInfoLabel: UILabel!
    @IBOutlet weak var deliveryFeeLabel: UILabel!
    
    func updateLabel(with detail: DetailDish) {
        self.pointLabel.text = detail.point
        self.deliveryInfoLabel.text = detail.deliveryInfo
        self.deliveryFeeLabel.text = detail.deliveryFee
    }
}

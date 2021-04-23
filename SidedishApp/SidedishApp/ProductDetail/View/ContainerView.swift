//
//  containerView.swift
//  SidedishApp
//
//  Created by Jun Ho JANG on 2021/04/21.
//

import UIKit

class ContainerView: UIView {
    
    @IBOutlet weak var productImage: UIScrollView!
    @IBOutlet weak var productDetailContainer: ProductDetailContainer!
    @IBOutlet weak var deliveryConditionContainer: DeliveryConditionContainer!
    @IBOutlet weak var orderQuantityContainer: OrderQuantityContainer!
    @IBOutlet weak var orderInfoContainer: OrderInfoContainer!
    @IBOutlet weak var productDescription: UIImageView!

}


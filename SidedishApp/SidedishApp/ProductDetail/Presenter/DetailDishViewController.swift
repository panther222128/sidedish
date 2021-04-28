//
//  DetailDishViewController.swift
//  SidedishApp
//
//  Created by Lia on 2021/04/28.
//

import UIKit

class DetailDishViewController: UIViewController {
    
    @IBOutlet weak var productImage: UIScrollView!
    @IBOutlet weak var detailContainer: ProductDetailContainer!
    @IBOutlet weak var purchaseInfoContainer: PurchaseInformationContainer!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var detailImageStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

}

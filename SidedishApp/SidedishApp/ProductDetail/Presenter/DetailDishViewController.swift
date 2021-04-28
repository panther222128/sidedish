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

// 실행이 안됨...와이...와이..!!!
extension DetailDishViewController: SendInfoDelegate {
    func send(detail: Dish?) {
        guard let dish = detail else { return }
        self.detailContainer.updateLabels(with: dish)
    }
}

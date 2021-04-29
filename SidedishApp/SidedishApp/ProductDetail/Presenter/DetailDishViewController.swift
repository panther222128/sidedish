//
//  DetailDishViewController.swift
//  SidedishApp
//
//  Created by Lia on 2021/04/28.
//

import UIKit

class DetailDishViewController: UIViewController {
    
    private var viewModel: DetailViewModel!
    
    var section: Section!
    var dish: Dish!
    
    @IBOutlet weak var productImage: UIScrollView!
    @IBOutlet weak var detailContainer: ProductDetailContainer!
    @IBOutlet weak var purchaseInfoContainer: PurchaseInformationContainer!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var detailImageStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = DefaultDetailViewModel()
        send(section: section, detail: dish)
        updatePurchaseView()
    }
}

extension DetailDishViewController: SendInfoDelegate {
    func send(section: Section, detail: Dish?) {
        guard let dish = detail else { return }
        self.detailContainer.updateLabels(with: dish)
        self.viewModel.request(from: section, with: dish.hashValue)
    }
}

extension DetailDishViewController {
    private func updatePurchaseView() {
        

        self.viewModel.update { detailDish in
            self.purchaseInfoContainer.updateLabel(with: detailDish)
            let imageview = UIImageView(image: UIImage(data: try! Data(contentsOf: URL(string: detailDish.thumbImage[0])!)))
            self.productImage.addSubview(imageview)
        }
    }
}

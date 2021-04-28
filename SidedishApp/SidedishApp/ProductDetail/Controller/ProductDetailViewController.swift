//
//  ProductDetailViewController.swift
//  SidedishApp
//
//  Created by Jun Ho JANG on 2021/04/20.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var productDetailView: ProductDetailView!
    
    private let productDetail = ProductDetail()
    private let deliveryCondition = DeliveryCondition()
    private let orderQuantity = OrderQuantity()
    private let orderInfo = OrderInfo()
    private let productDescriptionImage = ProductDescriptionImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureProductImage()
        configureProductDetail()
        configureDeliveryCondition()
        configureOrderQuantity()
        configureOrderInfo()
        configureProductDetailDescription()
        configureProductDetailDescription1()
        configureProductDetailDescription2()
    }
    
    func configureProductImage() {
        var contentWidth = CGFloat(0.0)
        if let containerView = productDetailView.containerView {
            for image in 0...3 {
                let imageToDisplay = UIImage(named: "무야호.jpg")
                let imageView = UIImageView(image: imageToDisplay)
                let xCoordinate = containerView.frame.midX + containerView.frame.width * CGFloat(image)
                let yCoordinate = containerView.frame.minY
                containerView.productImage.addSubview(imageView)
                imageView.contentMode = .scaleAspectFit
                imageView.frame = CGRect(x: xCoordinate - containerView.productImage.frame.width / 2, y: yCoordinate, width: containerView.productImage.frame.width, height: containerView.productImage.frame.height)
                contentWidth += containerView.productImage.frame.width
            }
            containerView.productImage.contentSize = CGSize(width: contentWidth, height: containerView.productImage.frame.height)
        }
    }
    
    func configureProductDetail() {
        if let containerView = productDetailView.containerView {
            containerView.productDetailContainer.eventBadge.text = productDetail.productDetailData[0].eventBadge
            containerView.productDetailContainer.eventBadge.clipsToBounds = true
            containerView.productDetailContainer.eventBadge.layer.cornerRadius = 5
        }
    }
    
    func configureDeliveryCondition() {
        if let containerView = productDetailView.containerView {
            containerView.deliveryConditionContainer.reserve.text = deliveryCondition.reserve
            containerView.deliveryConditionContainer.reserveAmount.text = deliveryCondition.reserveAmount
            containerView.deliveryConditionContainer.deliveryInfo.text = deliveryCondition.deliveryInfo
            containerView.deliveryConditionContainer.deliveryInfoDetail.text = deliveryCondition.deliveryInfoDetail
            containerView.deliveryConditionContainer.deliveryCharge.text = deliveryCondition.deliveryCharge
            containerView.deliveryConditionContainer.deliveryChargeAmount.text = deliveryCondition.deliveryChargeAmount
        }
    }
    
    func configureOrderQuantity() {
        if let containerView = productDetailView.containerView {
            containerView.orderQuantityContainer.quantity.text = orderQuantity.quantity
        }
    }
    
    func configureOrderInfo() {
        if let containerView = productDetailView.containerView {
            containerView.orderInfoContainer.totalAmountTitle.text = orderInfo.order
            containerView.orderInfoContainer.orderButton.titleLabel?.text = orderInfo.order
            containerView.orderInfoContainer.orderButton.layer.cornerRadius = 5
        }
    }
    
    func configureProductDetailDescription() {
        if let containerView = productDetailView.containerView {
            let imageToDisplay = UIImage(named: "무야호.jpg")
            let imageView = UIImageView(image: imageToDisplay)
            let xCoordinate = containerView.productDescription.frame.minX
            let yCoordinate = containerView.productDescription.frame.minY
            imageView.contentMode = .scaleAspectFill
            if let image = UIImage(named: "무야호.jpg") {
                let imageHeight = image.size.height
                imageView.frame = CGRect(x: xCoordinate, y: yCoordinate, width: containerView.productDescription.frame.width, height: imageHeight)
            }
            containerView.productDescription.image = imageToDisplay
        }
    }
    
    func configureProductDetailDescription1() {
        if let containerView = productDetailView.containerView {
            let imageToDisplay = UIImage(named: "무야호.jpg")
            let imageView = UIImageView(image: imageToDisplay)
            let xCoordinate = containerView.productDesxcription1.frame.minX
            let yCoordinate = containerView.productDesxcription1.frame.minY
            imageView.contentMode = .scaleAspectFill
            if let image = UIImage(named: "무야호.jpg") {
                let imageHeight = image.size.height
                imageView.frame = CGRect(x: xCoordinate, y: yCoordinate, width: containerView.productDesxcription1.frame.width, height: imageHeight)
            }
            containerView.productDesxcription1.image = imageToDisplay
        }
    }
    
    func configureProductDetailDescription2() {
        if let containerView = productDetailView.containerView {
            let imageToDisplay = UIImage(named: "무야호.jpg")
            let imageView = UIImageView(image: imageToDisplay)
            let xCoordinate = containerView.productDesxcription2.frame.minX
            let yCoordinate = containerView.productDesxcription2.frame.minY
            imageView.contentMode = .scaleAspectFill
            if let image = UIImage(named: "무야호.jpg") {
                let imageHeight = image.size.height
                imageView.frame = CGRect(x: xCoordinate, y: yCoordinate, width: containerView.productDesxcription2.frame.width, height: imageHeight)
            }
            containerView.productDesxcription2.image = imageToDisplay
        }
    }
    
}

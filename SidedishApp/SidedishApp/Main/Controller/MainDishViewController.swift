//
//  MainDishViewController.swift
//  SidedishApp
//
//  Created by Lia on 2021/04/20.
//

import UIKit

class MainDishViewController: UIViewController {
    
    @IBOutlet weak var dishCollectionView: UICollectionView!
    
    private var dishDataSource: UICollectionViewDiffableDataSource<Section, ProductModel>!
    private var snapshot = NSDiffableDataSourceSnapshot<Section, ProductModel>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        configureDataSource()
        createSnapshot()
    }
      
}

extension MainDishViewController {
    
    enum Section: Int, CaseIterable {
        case mainDish = 0, hotSoup, sideDish
    }
    
    typealias DishType = ProductModel
    typealias SectionType = Section
    
    private func registerNib() {
        let nibName = UINib(nibName: DishCell.reuseIdentifier, bundle: nil)
        dishCollectionView.register(nibName, forCellWithReuseIdentifier: DishCell.reuseIdentifier)
    }
    
    private func configureDataSource() {
        self.dishDataSource = UICollectionViewDiffableDataSource<SectionType, DishType>(collectionView: dishCollectionView) { (collectionView, indexPath, dish) -> DishCell? in
            
            guard let cell = self.dishCollectionView.dequeueReusableCell(withReuseIdentifier: DishCell.reuseIdentifier, for: indexPath) as? DishCell else { return DishCell()  }
            print(cell)
            print("d")
            
            cell.imageView.image = dish.image
            cell.nameLabel.text = dish.name
            cell.descriptionLabel.text = dish.description
            cell.priceLabel.text = dish.price
            cell.discountedPriceLabel.text = dish.discountedPrice
            cell.eventBadgeLabel.text = dish.eventBadge
            
            return cell
        }
    }
    
    private func createSnapshot() {
        self.snapshot.appendSections([.mainDish])
        self.snapshot.appendItems(DishManager.setDish())
        self.dishDataSource.apply(snapshot, animatingDifferences: false)
    }
}




class DishManager {
    typealias Dish = ProductModel
    
    private var dishes: [Dish]
    
    init(dishes: [Dish]) {
        self.dishes = dishes
    }
    
    static func setDish() -> [Dish] {
        var dishes = [Dish]()
        
        let data = try! Data(contentsOf: URL(string: "https://user-images.githubusercontent.com/73650994/115364788-ba0b4d00-a1fe-11eb-8066-7ed2c620d43e.jpeg")!)
        guard let image = UIImage(data: data) else {return []}
        
        let dish = Dish(image: image, name: "쿼카", description: "졸귀", price: "100억", discountedPrice: "그딴 거 없다", eventBadge: "초특가")
        
        dishes.append(dish)
        
        return dishes
    }
}

//
//  MainDishViewController.swift
//  SidedishApp
//
//  Created by Lia on 2021/04/20.
//

import UIKit

class MainDishViewController: UIViewController {

    enum Section: Int, CaseIterable {
        case mainDish = 0, hotSoup, sideDish
    }
    
    @IBOutlet weak var dishCollectionView: UICollectionView!
    
    
    private var dishDataSource: UICollectionViewDiffableDataSource<Section, ProductModel>!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    


}

extension MainDishViewController {
    
    typealias DishType = ProductModel
    typealias SectionType = Section
    
    func configureDataSource() {
        self.dishDataSource = UICollectionViewDiffableDataSource<SectionType, DishType>(collectionView: dishCollectionView, cellProvider: { (collectionView, indexPath, dish) -> UICollectionViewCell? in
            guard let cell = dishCollectionView.dequeueReusableCell(withReuseIdentifier: <#T##String#>, for: <#T##IndexPath#>) else { retrun  }
        })
    }
}

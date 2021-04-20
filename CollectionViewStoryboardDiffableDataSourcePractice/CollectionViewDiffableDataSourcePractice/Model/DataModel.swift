//
//  DataModel.swift
//  CollectionViewDiffableDataSourcePractice
//
//  Created by Jun Ho JANG on 2021/04/19.
//

import UIKit

struct Model: Hashable {
    let image: UIImage
    let name: String
    let role: String
    let nickName: String
    
    init(image: UIImage, name: String, role: String, nickName: String) {
        self.image = image
        self.name = name
        self.role = role
        self.nickName = nickName
    }
    
}

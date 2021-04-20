//
//  ViewModel.swift
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

struct ViewModel {
    
    private var member = [Model]()
    let imageArray = [UIImage(named: "효정.jpg"), UIImage(named: "미미.jpg")]
    let nameArray = ["효정", "미미"]
    let roleArray = ["메인보컬", "래퍼, 메인댄서"]
    let nickNameArray = ["캔디리더", "밈피디"]
    
    init() {
        for i in 0..<imageArray.count {
            if let image = imageArray[i] {
                member.append(Model(image: image, name: nameArray[i], role: roleArray[i], nickName: nickNameArray[i]))
            }
        }
    }
    
    var returnMember: [Model] {
        return member
    }

}

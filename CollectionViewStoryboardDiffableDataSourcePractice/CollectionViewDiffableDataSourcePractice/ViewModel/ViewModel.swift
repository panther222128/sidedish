//
//  ViewModel.swift
//  CollectionViewDiffableDataSourcePractice
//
//  Created by Jun Ho JANG on 2021/04/19.
//

import UIKit

struct ViewModel {
    
    private var member = [Model]()
    let imageArray = [UIImage(named: "효정.jpg"), UIImage(named: "미미.jpg"), UIImage(named: "유아.jpg"), UIImage(named: "승희.jpg"), UIImage(named: "지호.jpg"), UIImage(named: "비니.jpg"), UIImage(named: "아린.jpg")]
    let nameArray = ["효정", "미미", "유아", "승희", "지호", "비니", "아린"]
    let roleArray = ["메인보컬", "래퍼, 메인댄서", "서브보컬, 메인댄서", "메인보컬, 재간둥이", "서브보컬", "서브보컬", "서브보컬"]
    let nickNameArray = ["캔디리더", "밈피디", "샤샤", "씅씅이똥똥이", "죠", "영고빈", "극성아린맘연합주인공"]
    
    init() {
        makeModel()
    }
    
    mutating func makeModel() {
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

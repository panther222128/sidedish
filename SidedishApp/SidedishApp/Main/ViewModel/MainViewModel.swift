//
//  MainViewModel.swift
//  SidedishApp
//
//  Created by Lia on 2021/04/25.
//

import Foundation
import Combine

//protocol MainViewModel {
//    func s()
//}

class MainViewModel{//: MainViewModel {
    
    private let useCase = MainUseCase() // UseCase
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        requestAll()
    }
    
    private func requestAll() {
        Section.allCases.forEach { section in
            useCase.request(type: section) }
    }
    
    func update(completion: @escaping (Section, [Dish]) -> Void) {
        useCase.didFetchData { (section, item) in
            print("🙀", section, item)
            completion(section, item)
        }
    }
    
}

class MainUseCase {
    
    private enum NotificationName {
        static let fetched = Notification.Name("fetched")
    }
    
    private var dishes = [Dish]()
    private var cancellable = Set<AnyCancellable>()
    
    
    func request(type: Section) {
        let url = EndPoint.url(type: type)!
        
        NetworkService().request(url: url)
            .receive(on: DispatchQueue.main)
            .sink { (error) in
                print(error)
            } receiveValue: { (products) in
                self.fetch(type: type, data: products.body)
            }
            .store(in: &cancellable)
    }
    
    private func fetch(type: Section, data: [Dish]) {
        self.dishes = data
        let userInfo = ["type": type, "dishes": self.dishes] as [String : Any]
        
        NotificationCenter.default.post(name: NotificationName.fetched, object: nil, userInfo: userInfo)
    }
    
    func didFetchData(completion: @escaping (Section, [Dish]) -> Void) {
        NotificationCenter.default.publisher(for: NotificationName.fetched)
            .map{ ($0.userInfo as! Dictionary<String, Any>) }
            .sink { (userInfo) in
                completion(userInfo["type"] as! Section, userInfo["dishes"] as! [Dish])
            }.store(in: &cancellable)
    }
}

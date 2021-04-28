//
//  DetailViewModel.swift
//  SidedishApp
//
//  Created by Lia on 2021/04/28.
//

import Foundation
import Combine

protocol DetailViewModel {
    func update(completion: @escaping (Section, [DetailDish]) -> Void)
}

class DefaultDetailViewModel: DetailViewModel {
    
    private let useCase = DetailUseCase() // UseCase
    private var cancellable = Set<AnyCancellable>()
    
    private func request(from section: Section) {
        useCase.request(type: section)
    }
    
    func update(completion: @escaping (Section, [DetailDish]) -> Void) {
        useCase.didFetchData { (section, item) in
            completion(section, item)
        }
    }
    
}

class DetailUseCase {
    
    private enum NotificationName {
        static let fetched = Notification.Name("fetched")
    }
    
    private var detailDishes = [DetailDish]()
    private var cancellable = Set<AnyCancellable>()
    
    
    func request(type: Section) {
        let url = EndPoint.url(type: "\(type)")!
        
        NetworkService().request(type: DetailDishes.self, url: url)
            .receive(on: DispatchQueue.main)
            .sink { (error) in
                print(error)
            } receiveValue: { (productDetails) in
                self.fetch(type: type, data: productDetails.data)
            }
            .store(in: &cancellable)
    }
    
    private func fetch(type: Section, data: [DetailDish]) {
        self.detailDishes = data
        let userInfo = ["type": type, "details": self.detailDishes] as [String : Any]
        
        NotificationCenter.default.post(name: NotificationName.fetched, object: nil, userInfo: userInfo)
    }
    
    func didFetchData(completion: @escaping (Section, [DetailDish]) -> Void) {
        NotificationCenter.default.publisher(for: NotificationName.fetched)
            .map{ ($0.userInfo as! Dictionary<String, Any>) }
            .sink { (userInfo) in
                completion(userInfo["type"] as! Section, userInfo["details"] as! [DetailDish])
            }.store(in: &cancellable)
    }
}

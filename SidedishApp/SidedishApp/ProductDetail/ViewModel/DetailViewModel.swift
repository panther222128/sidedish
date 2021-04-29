//
//  DetailViewModel.swift
//  SidedishApp
//
//  Created by Lia on 2021/04/28.
//

import Foundation
import Combine

protocol DetailViewModel {
    func request(from section: Section, with hash: Int)
    func update(completion: @escaping (DetailDish) -> Void)
}

class DefaultDetailViewModel: DetailViewModel {
    
    private let useCase = DetailUseCase()
    
    func request(from section: Section, with hash: Int) {
        useCase.request(type: section, hash: hash)
    }
    
    func update(completion: @escaping (DetailDish) -> Void) {
        useCase.didFetchData { (item) in
            completion(item)
        }
    }
    
}

class DetailUseCase {
    
    private enum NotificationName {
        static let fetched = Notification.Name("fetched")
    }
    
    private var detailDish: DetailDish!
    private var cancellable = Set<AnyCancellable>()
    
    
    func request(type: Section, hash: Int) {
        let url = EndPoint.url(type: "\(type)/{\(hash)}")!
        
        NetworkService().request(type: DetailDishes.self, url: url)
            .receive(on: DispatchQueue.main)
            .sink { (error) in
                print(error)
            } receiveValue: { (productDetail) in
                self.fetch(type: type, data: productDetail.body[0].data)
            }
            .store(in: &cancellable)
    }
    
    private func fetch(type: Section, data: DetailDish) {
        self.detailDish = data
        let userInfo = ["detail": self.detailDish]
        
        NotificationCenter.default.post(name: NotificationName.fetched, object: nil, userInfo: userInfo as [AnyHashable : Any])
    }
    
    func didFetchData(completion: @escaping (DetailDish) -> Void) {
        NotificationCenter.default.publisher(for: NotificationName.fetched)
            .map{ ($0.userInfo as! Dictionary<String, Any>) }
            .sink { (userInfo) in
                completion(userInfo["detail"] as! DetailDish)
            }.store(in: &cancellable)
    }
}

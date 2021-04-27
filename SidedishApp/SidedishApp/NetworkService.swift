//
//  NetworkService.swift
//  SidedishApp
//
//  Created by Lia on 2021/04/25.
//

import Foundation
import Combine


enum EndPoint {
    private static let scheme = "https"
    private static let host = "h3rb9c0ugl.execute-api.ap-northeast-2.amazonaws.com"
    private static let path = "/develop/baminchan/"
    
    static func url(type: Section) -> URL? {
        var components = URLComponents()
        
        components.scheme = EndPoint.scheme
        components.host = EndPoint.host
        components.path = "\(EndPoint.path)\(type)"
        
        return components.url
    }
}

enum Section: String, CaseIterable {
    case main = "한그릇 뚝딱 메인 요리"
    case soup = "김이 모락모락 국.찌개"
    case side = "언제 먹어도 든든한 밑반찬"
}

enum NetworkError: Error {
    case BadURL
    case DecodeError
}

class NetworkService {
    
    func request(url: URL) -> AnyPublisher<Dishes, Error> {
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "get"
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                    httpResponse.statusCode == 200 else {
                    throw NetworkError.BadURL
                    }
                return element.data
            }
            .decode(type: Dishes.self, decoder: JSONDecoder())
            .mapError({ (error) -> Error in
                return error
            })
            .eraseToAnyPublisher()
    }
    
}

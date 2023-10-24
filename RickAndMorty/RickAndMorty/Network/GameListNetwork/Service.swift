//
//  Service.swift
//  RickAndMorty
//
//  Created by muhammed fatih elçi on 24.07.2023.
//

import Foundation
import Alamofire

protocol IRickAndMortyServiceProtocol {
    func FetchAllDatas(onsucces: @escaping ([Result]) -> Void, onFail: @escaping (String) -> Void)
}

class RickAndMortyService: IRickAndMortyServiceProtocol {
    func FetchAllDatas(onsucces: @escaping ([Result]) -> Void, onFail: @escaping (String) -> Void) {
        AF.request(ServiceEndPoint.RickAndMorty(), method: .get).validate().responseDecodable(of: Welcome.self){ model in
            guard let data = model.value else {
                onFail(model.debugDescription)
                return
            }
            let dataTwo = data.results
            onsucces(dataTwo)
        }
    }
}

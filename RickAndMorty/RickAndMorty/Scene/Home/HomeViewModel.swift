//
//  HomeViewModel.swift
//  RickAndMorty
//
//  Created by muhammed fatih elçi on 24.07.2023.
//

import Foundation
import Alamofire

class RickAndMortyViewModel: ViewModelProtocol {

     
     var delegate: ViewModelDelegate?
     private var service: IRickAndMortyServiceProtocol?
     var rickList: [Result] = []

     init(service: IRickAndMortyServiceProtocol) {
         self.service = service
     }
     
    func load() {
        service?.FetchAllDatas(onsucces: { model in
            self.delegate?.handleOutPut(.showList(model))
            self.rickList = model
        }, onFail: { data in
            print(data.debugDescription)
        })
    }
    
    func searchCharacter(key: String) {
        var charactersList: [Result] = []
        rickList.forEach({ item in
            if item.name.contains(key) {
                charactersList.append(item)
            }
        })
        delegate?.handleOutPut(.showList(charactersList))
    }
    
}

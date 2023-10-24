//
//  DetailViewModel.swift
//  RickAndMorty
//
//  Created by muhammed fatih elçi on 3.08.2023.
//

import Foundation
import Alamofire

class DetailPageViewModel: DetailPageViewModelProtocol {
    
    var view: DetailPageViewModelDelegate?
    var value: Result
    
    init(view: DetailPageViewModelDelegate, value: Result){
        self.view = view
        self.value = value
    }
    func load() {
        view?.update(value)
    }
}

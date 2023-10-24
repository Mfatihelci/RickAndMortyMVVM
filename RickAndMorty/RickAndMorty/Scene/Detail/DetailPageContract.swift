//
//  DetailContract.swift
//  RickAndMorty
//
//  Created by muhammed fatih elçi on 3.08.2023.
//

import Foundation

//MARK: - ViewModel
protocol DetailPageViewModelProtocol {
    func load()
}

protocol DetailPageViewModelDelegate {
    func update(_ value: Result)
}

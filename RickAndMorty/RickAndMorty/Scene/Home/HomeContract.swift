//
//  HomeContract.swift
//  RickAndMorty
//
//  Created by muhammed fatih elçi on 24.07.2023.
//

import Foundation

//MARK: - ViewModel
protocol ViewModelProtocol {
    var delegate: ViewModelDelegate? { get set }
    func load()
    func searchCharacter(key: String)
}

enum ViewModelOutPut {
    case showList([Result])
}

protocol ViewModelDelegate {
    func handleOutPut(_ output: ViewModelOutPut)
}

//MARK: - CollectionView

protocol CollectionViewProtocol {
    func update(value: [Result])
}

protocol CollectionViewDelegate {
    func onSelected(value: Result)
}

//
//  HomeBuilder.swift
//  RickAndMorty
//
//  Created by muhammed fatih elçi on 24.07.2023.
//

import Foundation

class HomePageBuilder {
    static func make() -> HomeViewController {
        let view = HomeViewController()
        view.viewModel = RickAndMortyViewModel(service: RickAndMortyService())
        return view
    }
}

//
//  DetailPageBuilder.swift
//  RickAndMorty
//
//  Created by muhammed fatih elçi on 3.08.2023.
//

import Foundation
import Alamofire

final class DetailPageBuilder {
    static func make(value: Result) -> DetailPageViewController {
        let vc = DetailPageViewController()
        let viewModel = DetailPageViewModel(view: vc, value: value)
        vc.viewModel = viewModel
        return vc
    }
}

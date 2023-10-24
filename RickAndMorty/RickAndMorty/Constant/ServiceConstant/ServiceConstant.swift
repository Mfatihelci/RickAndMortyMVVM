//
//  ServiceConstant.swift
//  RickAndMorty
//
//  Created by muhammed fatih elçi on 24.07.2023.
//

import Foundation

enum ServiceEndPoint: String {
    case BASE_URL = "https://rickandmortyapi.com/api/character"
}

extension ServiceEndPoint {
    static func RickAndMorty() -> String {
        return "\(BASE_URL.rawValue)"
    }
}

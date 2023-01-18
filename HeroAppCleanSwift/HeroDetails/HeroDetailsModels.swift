//
//  HeroDetailsModels.swift
//  HeroAppCleanSwift
//
//  Created by Татьяна on 18.01.2023.
//

import Foundation

enum HeroDetails {
    enum ShowDetails {
        struct Response {
            let heroName: String?
            let imageData: Data?
            let powerStats: String?
            let biography: String?
            let work: String?
            let isFavorite: Bool
        }
        struct ViewModel {
            let heroName: String
            let imageData: Data
            let powerStats: String
            let biography: String
            let work: String
            let isFavorite: Bool
        }
    }
}

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
            let saveButtonTitle: String
        }
        
        struct ViewModel {
            let heroName: String
            let imageData: Data
            let powerStats: String
            let biography: String
            let work: String
            let isFavorite: Bool
            let saveButtonTitle: String
        }
    }
    
    enum SetFavoriteStatus {
        struct Response {
            let isFavorite: Bool
        }
        
        struct ViewModel {
            let isFavorite: Bool
        }
    }
    
    enum AddAlert {
        struct Response {
            let title: String
            let message: String
        }
        
        struct ViewModel {
            let title: String
            let message: String
        }
    }
}

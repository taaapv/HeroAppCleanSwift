//
//  HeroListModels.swift
//  HeroAppCleanSwift
//
//  Created by Татьяна on 16.01.2023.
//

import Foundation

typealias HeroCellViewModel = HeroList.ShowHeros.ViewModel.HeroCellViewModel

protocol CellIdentifiable {
    var cellIdentifier: String { get }
    var cellHeight: Double { get }
}

enum HeroList {
    enum ShowHeros {
        struct Response {
            let heroes: [Hero]
        }
        
        struct ViewModel {
            struct HeroCellViewModel: CellIdentifiable {
                let name: String
                let imageUrl: String
                
                var cellIdentifier: String {
                    "HeroCell"
                }
                
                var cellHeight: Double {
                    110
                }
                
                init(hero: Hero) {
                    name = hero.name
                    imageUrl = hero.images.lg
                }
                
                func compareImages(with currentImageUrl: String) -> Bool {
                     return imageUrl == currentImageUrl
                }
            }
            
            let rows: [HeroCellViewModel]
        }
    }
}

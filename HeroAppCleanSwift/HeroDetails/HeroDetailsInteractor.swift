//
//  HeroDetailsInteractor.swift
//  HeroAppCleanSwift
//
//  Created by Татьяна on 18.01.2023.
//

import Foundation

protocol HeroDetailsBusinessLogic {
    func provideHeroDetails()
}

protocol HeroDetailsDataStore {
    var hero: Hero { get set }
}

class HeroDetailsInteractor: HeroDetailsBusinessLogic {
    var presenter: HeroDetailsPresentationLogic?
    
    func provideHeroDetails() {
        
    }
}


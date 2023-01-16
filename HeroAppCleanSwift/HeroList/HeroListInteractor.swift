//
//  HeroListInteractor.swift
//  HeroAppCleanSwift
//
//  Created by Татьяна on 16.01.2023.
//

import Foundation

protocol HeroListBusinessLogic {
    func fetchHeroes()
}

protocol HeroListDataStore {
    var heroes: [Hero] { get }
}

class HeroListInteractor: HeroListBusinessLogic, HeroListDataStore {
    var presenter: HeroListPresentationLogic?
    var heroes: [Hero] = []
    
    func fetchHeroes() {
        NetworkManager.shared.fetchHeroes { [unowned self] heroes in
            self.heroes = heroes
            let response = HeroList.ShowHeros.Response(heroes: self.heroes)
            self.presenter?.presentHeroes(response: response)
        }
    }
}

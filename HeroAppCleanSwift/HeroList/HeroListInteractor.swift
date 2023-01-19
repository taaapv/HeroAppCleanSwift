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
        NetworkManager.shared.fetch(dataType: [Hero].self, with: Link.heroes.rawValue) { [unowned self] result in
            switch result {
            case .success(let heroes):
                self.heroes = heroes
                let response = HeroList.ShowHeros.Response(heroes: self.heroes)
                self.presenter?.presentHeroes(response: response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

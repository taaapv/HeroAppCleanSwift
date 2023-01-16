//
//  HeroListPresenter.swift
//  HeroAppCleanSwift
//
//  Created by Татьяна on 16.01.2023.
//

import Foundation

protocol HeroListPresentationLogic {
    func presentHeroes(response: HeroList.ShowHeros.Response)
}

class HeroListPresenter: HeroListPresentationLogic {
    weak var viewController: HeroListDisplayLogic?
    
    func presentHeroes(response: HeroList.ShowHeros.Response) {
        var rows: [HeroCellViewModel] = []
        
        response.heroes.forEach { rows.append(HeroCellViewModel(hero: $0)) }
        let viewModel = HeroList.ShowHeros.ViewModel(rows: rows)
        viewController?.displayHeroes(viewModel: viewModel)
    }
}

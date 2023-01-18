//
//  HeroDetailsPresenter.swift
//  HeroAppCleanSwift
//
//  Created by Татьяна on 18.01.2023.
//

import Foundation

protocol HeroDetailsPresentationLogic {
    func presentHeroDetails(response: HeroDetails.ShowDetails.Response)
}

class HeroDetailsPresenter: HeroDetailsPresentationLogic {
    weak var viewController: HeroDetailsDisplayLogic?
    
    func presentHeroDetails(response: HeroDetails.ShowDetails.Response) {
        let viewModel = HeroDetails.ShowDetails.ViewModel(
            heroName: response.heroName ?? "",
            imageData: response.imageData ?? Data(),
            powerStats: response.powerStats ?? "",
            biography: response.biography ?? "",
            work: response.work ?? "",
            isFavorite: response.isFavorite
        )
        viewController?.displayHero(viewModel: viewModel)
    }
}

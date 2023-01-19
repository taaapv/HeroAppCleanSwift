//
//  HeroDetailsPresenter.swift
//  HeroAppCleanSwift
//
//  Created by Татьяна on 18.01.2023.
//

import Foundation

protocol HeroDetailsPresentationLogic {
    func presentHeroDetails(response: HeroDetails.ShowDetails.Response)
    func setFavoriteStatus(response: HeroDetails.SetFavoriteStatus.Response)
    func passDataForAlert(response: HeroDetails.AddAlert.Response)
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
            isFavorite: response.isFavorite,
            saveButtonTitle: response.saveButtonTitle
        )
        viewController?.displayHero(viewModel: viewModel)
    }
    
    func setFavoriteStatus(response: HeroDetails.SetFavoriteStatus.Response) {
        let viewModel = HeroDetails.SetFavoriteStatus.ViewModel(isFavorite: response.isFavorite)
        viewController?.displayFavoriteStatus(viewModel: viewModel)
    }
    
    func passDataForAlert(response: HeroDetails.AddAlert.Response) {
        let viewModel = HeroDetails.AddAlert.ViewModel(
            title: response.title,
            message: response.message)
        viewController?.displayAlert(viewModel: viewModel)
    }
}

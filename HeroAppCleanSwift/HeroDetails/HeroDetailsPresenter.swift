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
        
    }
}

//
//  HeroListConfigurator.swift
//  HeroAppCleanSwift
//
//  Created by Татьяна on 16.01.2023.
//

import Foundation

class HeroListConfigurator {
    static let shared = HeroListConfigurator()
    private init() {}
    
    func configure(with viewController: HeroListViewController) {
        let interactor = HeroListInteractor()
        let presenter = HeroListPresenter()
        let router = HeroListRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
}

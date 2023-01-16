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
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
}

//
//  HeroDetailsInteractor.swift
//  HeroAppCleanSwift
//
//  Created by Татьяна on 18.01.2023.
//

import Foundation

protocol HeroDetailsBusinessLogic {
    var isFavorite: Bool { get }
    func provideHeroDetails()
}

protocol HeroDetailsDataStore {
    var hero: Hero? { get set }
}

class HeroDetailsInteractor: HeroDetailsBusinessLogic, HeroDetailsDataStore {
    var hero: Hero?
    var presenter: HeroDetailsPresentationLogic?
    var worker: HeroDetailsWorker?
    var isFavorite = false
    
    func provideHeroDetails() {
        worker = HeroDetailsWorker()
        
        let imageData = worker?.getImage(from: hero?.images.lg)
        
        let response = HeroDetails.ShowDetails.Response(
            heroName: hero?.name,
            imageData: imageData,
            powerStats: "Power stats: intelligence - \(hero?.powerstats.intelligence ?? 0), power -  \(hero?.powerstats.power ?? 0)",
            biography: "Biography: place of birth - \(hero?.biography.placeOfBirth ?? ""), first appearance -  \(hero?.biography.firstAppearance ?? "")",
            work: "Work: \(hero?.work.occupation ?? "")",
            isFavorite: isFavorite
        )
        presenter?.presentHeroDetails(response: response)
    }
}


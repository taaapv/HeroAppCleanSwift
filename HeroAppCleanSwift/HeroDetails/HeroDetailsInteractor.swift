//
//  HeroDetailsInteractor.swift
//  HeroAppCleanSwift
//
//  Created by Татьяна on 18.01.2023.
//

import Foundation

protocol HeroDetailsBusinessLogic {
    var isFavorite: Bool { get }
    var saveButtonTitle: String { get }
    
    func provideHeroDetails()
    func setFavoriteStatus()
    func saveButtonTapped()
}

protocol HeroDetailsDataStore {
    var hero: Hero? { get set }
}

class HeroDetailsInteractor: HeroDetailsBusinessLogic, HeroDetailsDataStore {
    var hero: Hero?
    var presenter: HeroDetailsPresentationLogic?
    var worker: HeroDetailsWorker?
    var isFavorite = false
    var saveButtonTitle = "Save hero"
    
    
    func provideHeroDetails() {
        worker = HeroDetailsWorker()
        
        isFavorite = worker?.getFavoriteStatus(for: hero?.id ?? 0) ?? false
        
        ImageManager.shared.fetchImage(with: hero?.images.lg) { [unowned self] result in
            switch result {
            case .success(let imageData):
                let response = HeroDetails.ShowDetails.Response(
                    heroName: hero?.name,
                    imageData: imageData,
                    powerStats: "Power stats: intelligence - \(hero?.powerstats.intelligence ?? 0), power -  \(hero?.powerstats.power ?? 0)",
                    biography: "Biography: place of birth - \(hero?.biography.placeOfBirth ?? ""), first appearance -  \(hero?.biography.firstAppearance ?? "")",
                    work: "Work: \(hero?.work.occupation ?? "")",
                    isFavorite: isFavorite,
                    saveButtonTitle: saveButtonTitle
                )
                self.presenter?.presentHeroDetails(response: response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func setFavoriteStatus() {
        isFavorite.toggle()
        worker?.setFavoriteStatus(for: hero?.id ?? 0, with: isFavorite)
        
        let response = HeroDetails.SetFavoriteStatus.Response(isFavorite: isFavorite)
        
        presenter?.setFavoriteStatus(response: response)
    }
    
    func saveButtonTapped() {
        NetworkManager.shared.postRequest(with: hero, to: Link.postRequest.rawValue) { [unowned self] result in
            switch result {
            case .success(let heroJson):
                print(heroJson)
                let response = HeroDetails.AddAlert.Response(
                    title: "Success!",
                    message: "You saved the hero \(hero?.name ?? "") to the server."
                )
                self.presenter?.passDataForAlert(response: response)
            case .failure(let error):
                print(error)
                let response = HeroDetails.AddAlert.Response(
                    title: "Failure!",
                    message: "You did not save the hero \(hero?.name ?? "") to the server."
                )
                self.presenter?.passDataForAlert(response: response)
            }
        }
    }
}


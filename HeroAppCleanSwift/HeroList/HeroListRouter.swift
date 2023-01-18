//
//  HeroListRouter.swift
//  HeroAppCleanSwift
//
//  Created by Татьяна on 18.01.2023.
//

import UIKit

@objc protocol HeroListRoutingLogic {
    func routeToHeroDetails(segue: UIStoryboardSegue?)
}

protocol HeroListDataPassing {
    var dataStore: HeroListDataStore? { get }
}

class HeroListRouter: NSObject, HeroListRoutingLogic, HeroListDataPassing {
    weak var viewController: HeroListViewController?
    var dataStore: HeroListDataStore?
    
    func routeToHeroDetails(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! HeroDetailsViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToHeroDetails(sourse: dataStore!, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "HeroDetailsViewController") as! HeroDetailsViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToHeroDetails(sourse: dataStore!, destination: &destinationDS)
            navigateToHeroDetails(sourse: viewController!, destination: destinationVC)
        }
    }
        private func navigateToHeroDetails(sourse: HeroListViewController, destination: HeroDetailsViewController) {
            sourse.show(destination, sender: nil)
        }
        
        private func passDataToHeroDetails(sourse: HeroListDataStore, destination: inout HeroDetailsDataStore) {
            guard let indexPath = viewController?.tableView.indexPathForSelectedRow else { return }
            destination.hero = sourse.heroes[indexPath.row]
        }
}

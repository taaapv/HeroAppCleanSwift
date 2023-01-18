//
//  HeroDetailsRouter.swift
//  HeroAppCleanSwift
//
//  Created by Татьяна on 18.01.2023.
//

import Foundation

@objc protocol HeroDetailsRoutingLogic {
    
}

protocol HeroDetailsDataPassing {
    var dataStore: HeroDetailsDataStore? { get }
}

class HeroDetailsRouter: NSObject, HeroDetailsRoutingLogic, HeroDetailsDataPassing {
    weak var viewController: HeroDetailsViewController?
    var dataStore: HeroDetailsDataStore?
}

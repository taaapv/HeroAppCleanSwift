//
//  HeroDetailsWorker.swift
//  HeroAppCleanSwift
//
//  Created by Татьяна on 18.01.2023.
//

import Foundation

class HeroDetailsWorker {
    func setFavoriteStatus(for key: Int, with value: Bool) {
        DataManager.shared.setFavoriteStatus(for: key, with: value)
    }
    
    func getFavoriteStatus(for key: Int) -> Bool {
        DataManager.shared.getFavoriteStatus(for: key)
    }
}

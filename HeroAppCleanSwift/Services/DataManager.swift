//
//  DataManager.swift
//  HeroAppCleanSwift
//
//  Created by Татьяна on 18.01.2023.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    private let userDefaults = UserDefaults()
    private init() {}
    
    func setFavoriteStatus(for key: Int, with value: Bool) {
        userDefaults.set(value, forKey: key.formatted())
    }
    
    func getFavoriteStatus(for key: Int) -> Bool {
        userDefaults.bool(forKey: key.formatted())
    }
}

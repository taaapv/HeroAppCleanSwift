//
//  HeroDetailsWorker.swift
//  HeroAppCleanSwift
//
//  Created by Татьяна on 18.01.2023.
//

import Foundation

class HeroDetailsWorker {
    func getImage(from urlString: String?) -> Data? {
        ImageManager.shared.fetchImage(with: urlString)
    }
}

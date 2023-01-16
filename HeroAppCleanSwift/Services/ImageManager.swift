//
//  ImageManager.swift
//  HeroAppCleanSwift
//
//  Created by Татьяна on 16.01.2023.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
    private init() {}
    
    func fetchImage(with urlString: String) -> Data? {
        guard let url = URL(string: urlString) else { return nil }
        guard let imageData = try? Data(contentsOf: url) else { return nil }
        return imageData
    }
}

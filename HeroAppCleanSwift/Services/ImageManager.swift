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
    
    func fetchImage(with urlString: String?, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: urlString ?? "") else {
            completion(.failure(.invalidUrl))
            return
        }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
}

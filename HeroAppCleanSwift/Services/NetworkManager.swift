//
//  NetworkManager.swift
//  HeroAppCleanSwift
//
//  Created by Татьяна on 16.01.2023.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func fetchHeroes(completion: @escaping([Hero]) -> Void) {
        guard let url = URL(string: Link.heroes.rawValue) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            do {
                let heroes = try JSONDecoder().decode([Hero].self, from: data)
                DispatchQueue.main.async {
                    completion(heroes)
                }
            } catch {
                print(error)
            }
            
        }.resume()
    }
}

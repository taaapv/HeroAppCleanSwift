//
//  NetworkManager.swift
//  HeroAppCleanSwift
//
//  Created by Татьяна on 16.01.2023.
//

import Foundation

enum Link: String {
    case heroes = "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/all.json"
    case postRequest = "https://jsonplaceholder.typicode.com/posts"
}

enum NetworkError: Error {
    case invalidUrl
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func fetch<T: Codable>(dataType: T.Type, with urlString: String?, completion: @escaping(Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: urlString ?? "") else {
            completion(.failure(.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let type = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(type))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func postRequest(with hero: Hero?, to urlString: String?, completion: @escaping(Result<Any, NetworkError>) -> Void) {
        guard let url = URL(string: urlString ?? "") else {
            completion(.failure(.invalidUrl))
            return
        }
        
        guard let heroData = try? JSONEncoder().encode(hero) else {
            completion(.failure(.noData))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = heroData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, let response = response else {
                completion(.failure(.noData))
                return
            }
            print(response)
            
            do {
                let hero = try JSONDecoder().decode(Hero.self, from: data)
                completion(.success(hero))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}

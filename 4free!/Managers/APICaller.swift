//
//  APICaller.swift
//  4free!
//
//  Created by Leonardo Macedo on 12/03/24.
//

import Foundation

struct Constraints {
    static let baseURL = "https://www.freetogame.com/api"
}

enum APIError: Error {
    case failedTogetData
}

class APICaller {
    static let shered = APICaller()
    
    func getGames(completion: @escaping (Result<[Game], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constraints.baseURL)/games") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(APIError.failedTogetData))
                return
            }
            
            do {
                let results = try JSONDecoder().decode([Game].self, from: data)
                completion(.success(results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getGamesById(id: Int, completion: @escaping (Result<Game, Error>) -> Void) {
        guard let url = URL(string: "\(Constraints.baseURL)/game?id=\(id)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(APIError.failedTogetData))
                return
            }
            
            do {
                let game = try JSONDecoder().decode(Game.self, from: data)
                completion(.success(game))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getGamesByCategory(with category: String, completion: @escaping (Result<[Game], Error>) -> Void ) {
        guard let url = URL(string: "\(Constraints.baseURL)/games?category=\(category)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(APIError.failedTogetData))
                return
            }
            
            do {
                let results = try JSONDecoder().decode([Game].self, from: data)
                completion(.success(results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getGamesByRelevance(completion: @escaping (Result<[Game], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constraints.baseURL)/games?short-by-relevance") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(APIError.failedTogetData))
                return
            }
            
            do {
                let results = try JSONDecoder().decode([Game].self, from: data)
                completion(.success(results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
}

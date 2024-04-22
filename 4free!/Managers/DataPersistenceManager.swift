//
//  DataPersistenceManager.swift
//  4free!
//
//  Created by Leonardo Macedo on 01/04/24.
//

import Foundation
import UIKit
import CoreData

class DataPersistenceManager {
    
    enum DatabaseError: Error {
        case failedToSaveData
        case failedToFetchData
        case failedToDeleteData
    }

    static let shared = DataPersistenceManager()
    
    func addGameToFavorite(model: Game, completion: @escaping (Result<Void, Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let item = GameItem(context: context)
        
        item.id = Int64(model.id)
        item.title = model.title
        item.thumbnail = model.thumbnail
        item.short_description = model.short_description
        item.gameDescription = model.description
        item.genre = model.genre
        item.plataform = model.plataform
        item.developer = model.developer
        item.release_date = model.release_date
        item.freetogame_profile_url = model.freetogame_profile_url
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DatabaseError.failedToSaveData))
        }
    }
        
    func fetchingGamesFromDataBase(completion: @escaping (Result<[GameItem], Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        let request: NSFetchRequest<GameItem>
        
        request = GameItem.fetchRequest()
        
        do {
            let games = try context.fetch(request)
            completion(.success(games))
        } catch {
            completion(.failure(DatabaseError.failedToFetchData))
        }
    }
    
    func deleteGameWith(model: GameItem, completion: @escaping (Result<Void, Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(model)
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DatabaseError.failedToDeleteData))
        }
    }
    
}

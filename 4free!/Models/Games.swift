//
//  Games.swift
//  4free!
//
//  Created by Leonardo Macedo on 11/03/24.
//

import Foundation

struct TredingGamesResponse: Codable {
    let results: [Games]
}

struct Games: Codable {
    let id: Int
    let title: String
    let short_description: String
    let description: String
    let genre: String
    let plataform: String
    let developer: String
    let release_date: String
    let freetogame_profile_url: String
}

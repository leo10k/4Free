//
//  CategoryDetailViewController.swift
//  4free!
//
//  Created by Leonardo Macedo on 07/03/24.
//

import UIKit

enum GameCategory: String {
    case mmorpg
    case shooter
    case moba
    case anime
    case battleRoyale = "battle-royale"
    case strategy
    case fantasy
    case sciFi = "sci-fi"
    case cardGames = "card"
    case racing
    case fighting
    case social
    case sports
    
    init?(category: String) {
        switch category {
        case "MMORPG":
            self = .mmorpg
        case "Shooter":
            self = .shooter
        case "MOBA":
            self = .moba
        case "Anime":
            self = .anime
        case "Battle Royale":
            self = .battleRoyale
        case "Strategy":
            self = .strategy
        case "Fantasy":
            self = .fantasy
        case "Sci-Fi":
            self = .sciFi
        case "Card Games":
            self = .cardGames
        case "Racing":
            self = .racing
        case "Fighting":
            self = .fighting
        case "Social":
            self = .social
        case "Sports":
            self = .sports
        default:
            return nil
        }
    }
    
    static func stringValue(for category: String) -> String? {
        return GameCategory(category: category)?.rawValue
    }
}

class CategoryDetailViewController: UIViewController {
    
    var category: String?
    
    private var games: [Game] = [Game]()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(GamesTableViewCell.self, forCellReuseIdentifier: GamesTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let category = category {
            title = category
        }
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        view .addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        
        loadGamesbyCategory()
    }
    
    private func loadGamesbyCategory() {
        guard let categoryName = GameCategory.stringValue(for: category!) else { return }
        APICaller.shared.getGamesByCategory(with: categoryName, completion: { [weak self] result in
            switch result {
            case .success(let games):
                self?.games = games
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    func navigateToGamePreview(with gameId: Int) {
        let gamePreviewVC = GamePreviewViewController()
        gamePreviewVC.gameId = gameId
        navigationController?.pushViewController(gamePreviewVC, animated: true)
    }
}

extension CategoryDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GamesTableViewCell.identifier, for: indexPath) as? GamesTableViewCell else {
            return UITableViewCell()
        }
        let game = games[indexPath.row]
        cell.configure(with: GameViewModel(title: game.title ?? "Unknown title name", thumbnail: game.thumbnail ?? "Unknown"))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedGame = games[indexPath.row]
        navigateToGamePreview(with: selectedGame.id)
    }
}

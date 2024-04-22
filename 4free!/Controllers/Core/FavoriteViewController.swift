//
//  SearchViewController.swift
//  4free!
//
//  Created by Leonardo Macedo on 21/02/24.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    private var games: [GameItem] = [GameItem]()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(GameListTableViewCell.self, forCellReuseIdentifier: GameListTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Favorites"
        view.addSubview(tableView)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.tintColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        NotificationCenter.default.addObserver(forName: NSNotification.Name("add to favorites"), object: nil, queue: nil) { _ in
            self.fetchLocalStorageForFavorites()
        }
    }
    
    private func fetchLocalStorageForFavorites() {
        DataPersistenceManager.shared.fetchingGamesFromDataBase { [weak self] result in
            switch result {
            case .success(let games):
                self?.games = games
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func navigateToGamePreview(with gameId: Int) {
        let gamePreviewVC = GamePreviewViewController()
        gamePreviewVC.gameId = gameId
        navigationController?.pushViewController(gamePreviewVC, animated: true)
    }
}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GameListTableViewCell.identifier, for: indexPath) as? GameListTableViewCell else {
            return UITableViewCell()
        }
        let game = games[indexPath.row]
        cell.configure(with: GamePreviewViewModel(title: game.title ?? "Unknow", thumbnail: game.thumbnail ?? "Unknow", short_description: game.short_description ?? "Unknow", genre: game.genre ?? "Unknow"))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            DataPersistenceManager.shared.deleteGameWith(model: games[indexPath.row]) { [weak self] result in
                switch result {
                case .success():
                    print("Deleted from database")
                case .failure(let error):
                    print(error.localizedDescription)
                }
                self?.games.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        default:
            break;
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedGame = games[indexPath.row]
        navigateToGamePreview(with: Int(selectedGame.id))
    }
    
}

//
//  BrowseGamesViewController.swift
//  4free!
//
//  Created by Leonardo Macedo on 21/02/24.
//

import UIKit

class BrowseGamesViewController: UIViewController {
    
    private var games: [Game] = [Game]()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(GameListTableViewCell.self, forCellReuseIdentifier: GameListTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Browse Games"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getGames()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func getGames() {
        APICaller.shered.getGamesByRelevance(completion: { [weak self] result in
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

extension BrowseGamesViewController: UITableViewDelegate, UITableViewDataSource {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedGame = games[indexPath.row]
        navigateToGamePreview(with: selectedGame.id)
    }
}

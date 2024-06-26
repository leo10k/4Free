//
//  ViewController.swift
//  4free!
//
//  Created by Leonardo Macedo on 21/02/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var games: [Game] = [Game]()
    
    private var headerView: GameUIView?
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(GamesTableViewCell.self, forCellReuseIdentifier: GamesTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
        let headerView = GameUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 320))
        tableView.tableHeaderView = headerView
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        loadGames()
    }
    
    private func loadGames() {
        APICaller.shared.getGames { [weak self] result in
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
    
    func navigateToGamePreview(with gameId: Int) {
        let gamePreviewVC = GamePreviewViewController()
        gamePreviewVC.gameId = gameId
        navigationController?.pushViewController(gamePreviewVC, animated: true)
    }
    
    private func addToFavoriteAt(indexPath: IndexPath) {
        DataPersistenceManager.shared.addGameToFavorite(model: games[indexPath.row]) { result in
            switch result {
            case .success():
                NotificationCenter.default.post(name: NSNotification.Name("added to favorites"), object: nil)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
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
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let config = UIContextMenuConfiguration(
            identifier: nil,
            previewProvider: nil) {[weak self] _ in
                let favoriteAction = UIAction(title: "Add to Favorites", subtitle: nil, image: nil, identifier: nil, discoverabilityTitle: nil, state: .off) { _ in
                    self?.addToFavoriteAt(indexPath: indexPath)
                    
                }
                return UIMenu(title: "", image: nil, identifier: nil, options: .displayInline, children: [favoriteAction])
            }
        return config
    }
}

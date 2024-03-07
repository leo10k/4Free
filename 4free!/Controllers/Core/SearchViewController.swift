//
//  SearchViewController.swift
//  4free!
//
//  Created by Leonardo Macedo on 21/02/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let discoverTable: UITableView = {
        let table = UITableView()
        table.register(GameListTableViewCell.self, forCellReuseIdentifier: GameListTableViewCell.identifier)
        return table
    } ()
    
    private let searchController: UISearchController = {
        //TODO: implement the UISearchController
        let controller = UISearchController()
        controller.searchBar.placeholder = "Search for a Game"
        controller.searchBar.searchBarStyle = .minimal
        return controller
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        navigationItem.searchController = searchController
        
        view.addSubview(discoverTable)
        
        discoverTable.delegate = self
        discoverTable.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        discoverTable.frame = view.bounds
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GameListTableViewCell.identifier, for: indexPath) as? GameListTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = GamePreviewViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func searchResultsViewControllerDidTapItem(_ viewModel: HomeViewController) {
        let vc = HomeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

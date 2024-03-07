//
//  CategoryDetailViewController.swift
//  4free!
//
//  Created by Leonardo Macedo on 07/03/24.
//

import UIKit

class CategoryDetailViewController: UIViewController {
    
    var category: String?
    
    var games: [String] = []
    
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
    }
}

extension CategoryDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GamesTableViewCell.identifier, for: indexPath) as? GamesTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = GamePreviewViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


//
//  ViewController.swift
//  4free!
//
//  Created by Leonardo Macedo on 21/02/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    let imageUrls: [String] = ["cs2"]
    
    private var headerView: GameUIView?
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(GamesTableViewCell.self, forCellReuseIdentifier: GamesTableViewCell.identifier)
        return tableView
    }()
    
    
    
    let models = [
        "New York",
        "London",
        "Hong Kong",
        "Rio",
        "Seattle",
        "New York",
        "London",
        "Hong Kong",
        "Rio",
        "Seattle",
        "New York",
        "London",
        "Hong Kong",
        "Rio",
        "Seattle",
        "New York",
        "London",
        "Hong Kong",
        "Rio",
        "Seattle",
        "New York",
        "London",
        "Hong Kong",
        "Rio",
        "Seattle"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
        let headerView = GameUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 350))
        tableView.tableHeaderView = headerView
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
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
}







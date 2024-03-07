//
//  CategoryViewController.swift
//  4free!
//
//  Created by Leonardo Macedo on 21/02/24.
//

import UIKit

class CategoryViewController: UIViewController {
    
    let categories: [String] = [
        "MMORPG",
        "Shooter",
        "MOBA",
        "Anime",
        "Battle Royale",
        "Strategy",
        "Fantasy",
        "Sci-Fi",
        "Card Games",
        "Racing",
        "Fighting",
        "Social",
        "Sports"
    ]
    
    private let categoryTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CategoryNameListTableViewCell.self, forCellReuseIdentifier: CategoryNameListTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Category"
        
        view.addSubview(categoryTableView)
        
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        
        categoryTableView.frame = view.bounds
    }
}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryNameListTableViewCell.identifier, for: indexPath) as? CategoryNameListTableViewCell else {
            return UITableViewCell()
        }
        cell.categoryNameLabel.text = categories[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCategory = categories[indexPath.row]
        let categoryDetailViewController = CategoryDetailViewController()
        categoryDetailViewController.category = selectedCategory
        navigationController?.pushViewController(categoryDetailViewController, animated: true)
    }
    
}

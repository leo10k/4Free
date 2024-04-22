//
//  GamePreviewViewController.swift
//  4free!
//
//  Created by Leonardo Macedo on 25/02/24.
//

import UIKit
import SDWebImage

class GamePreviewViewController: UIViewController {
    
    private var game: Game?
    var gameId: Int?
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()

    private let gameImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let freeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("FREE", for: .normal)
        button.backgroundColor = UIColor(red: CGFloat(0x32) / 255.0, green: CGFloat(0x35) / 255.0, blue: CGFloat(0x38) / 255.0, alpha: 1.0)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.cornerRadius = 6
        return button
    }()
    
    private let playNowButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.setTitle("PLAY NOW", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 6
        return button
    }()
    
    private let titleGameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let subTitleGameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        scrollView.addSubview(gameImageView)
        scrollView.addSubview(freeButton)
        scrollView.addSubview(playNowButton)
        scrollView.addSubview(titleGameLabel)
        scrollView.addSubview(subTitleGameLabel)
        
        configureConstraints()
        
        if let gameId = gameId {
            APICaller.shared.getGamesById(id: gameId) { [weak self] result in
                switch result {
                case .success(let game):
                    self?.game = game
                    DispatchQueue.main.async {
                        self?.updateUI()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func updateUI() {
        guard let game = game else { return }
        
        guard let url = URL(string: game.thumbnail ?? "") else {return}
        
        gameImageView.sd_setImage(with: url)
        titleGameLabel.text = game.title
        subTitleGameLabel.text = game.description
    }
    
    func configureConstraints() {
        
        let scrollViewConstraints = [
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        let gameImageViewConstraints = [
            gameImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            gameImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            gameImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ]
        
        let freeButtonConstraints = [
            freeButton.topAnchor.constraint(equalTo: gameImageView.bottomAnchor, constant: 10),
            freeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            freeButton.heightAnchor.constraint(equalToConstant: 40),
            freeButton.widthAnchor.constraint(equalToConstant: 56)
        ]
        
        let playNowButtonConstraints = [
            playNowButton.topAnchor.constraint(equalTo: gameImageView.bottomAnchor, constant: 10),
            playNowButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            playNowButton.heightAnchor.constraint(equalToConstant: 40),
            playNowButton.widthAnchor.constraint(equalToConstant: 280)
        ]
        
        let titleGameLabelConstraints = [
            titleGameLabel.topAnchor.constraint(equalTo: playNowButton.bottomAnchor, constant: 20),
            titleGameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleGameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ]
        
        let subTitleGameLabelConstraints = [
            subTitleGameLabel.topAnchor.constraint(equalTo: titleGameLabel.bottomAnchor, constant: 8),
            subTitleGameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            subTitleGameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            subTitleGameLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20)
        ]
        
        NSLayoutConstraint.activate(scrollViewConstraints)
        NSLayoutConstraint.activate(gameImageViewConstraints)
        NSLayoutConstraint.activate(freeButtonConstraints)
        NSLayoutConstraint.activate(playNowButtonConstraints)
        NSLayoutConstraint.activate(titleGameLabelConstraints)
        NSLayoutConstraint.activate(subTitleGameLabelConstraints)
    }
}

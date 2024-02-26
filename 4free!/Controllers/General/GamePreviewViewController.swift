//
//  GamePreviewViewController.swift
//  4free!
//
//  Created by Leonardo Macedo on 25/02/24.
//

import UIKit

class GamePreviewViewController: UIViewController {
    
    private let gameImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "cs2")
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
        label.text = "Conter Strike 2"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let subTitleGameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Counter-Strike 2 is a multiplayer tactical first-person shooter. In the game, two teams, the Counter-Terrorists and the Terrorists, compete to complete different objectives, depending on the game mode selected; players are split into these teams at the start of each match."
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(gameImageView)
        view.addSubview(freeButton)
        view.addSubview(playNowButton)
        view.addSubview(titleGameLabel)
        view.addSubview(subTitleGameLabel)
        configureConstraints()
    }
    
    func configureConstraints() {
        
        let gameImageViewConstraints = [
            gameImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            gameImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            gameImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ]
        
        let freeButtonConstraints = [
            freeButton.topAnchor.constraint(equalTo: gameImageView.bottomAnchor, constant: -80),
            freeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            freeButton.heightAnchor.constraint(equalToConstant: 40),
            freeButton.widthAnchor.constraint(equalToConstant: 56)
        ]
        
        let playNowButtonConstraints = [
            playNowButton.topAnchor.constraint(equalTo: gameImageView.bottomAnchor, constant: -80),
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
            subTitleGameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(gameImageViewConstraints)
        NSLayoutConstraint.activate(freeButtonConstraints)
        NSLayoutConstraint.activate(playNowButtonConstraints)
        NSLayoutConstraint.activate(titleGameLabelConstraints)
        NSLayoutConstraint.activate(subTitleGameLabelConstraints)
    }
}

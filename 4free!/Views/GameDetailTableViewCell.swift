//
//  CustomGameDetailTableViewCell.swift
//  4free!
//
//  Created by Leonardo Macedo on 23/02/24.
//

import UIKit

class GameDetailTableViewCell: UITableViewCell {
    
    static let identifier = "GameDetailTableViewCell"
    
    private let conteinerView: UIView = {
        let conteiner = UIView()
        conteiner.translatesAutoresizingMaskIntoConstraints = false
        conteiner.backgroundColor = UIColor(red: CGFloat(0x32) / 255.0, green: CGFloat(0x35) / 255.0, blue: CGFloat(0x38) / 255.0, alpha: 1.0)
        conteiner.layer.cornerRadius = 8
        return conteiner
    }()

    private let gameImageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "cs2")
        return image
    }()
    
    private let titleGameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Counter Strike 2"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private let subTitleGameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "A first player shooter game, you objective it's you play agast five online playes and try to win the round"
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    private let gameCategoryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Shooter", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.backgroundColor = .gray
        button.layer.cornerRadius = 4
        button.titleLabel?.minimumScaleFactor = 0.5
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(conteinerView)
        addSubview(gameImageView)
        addSubview(titleGameLabel)
        addSubview(subTitleGameLabel)
        addSubview(gameCategoryButton)
        
        applyConstraints()
    }
    
    private func applyConstraints() {
        
        let containerViewConstraints = [
            conteinerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
            conteinerView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            conteinerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            conteinerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
            conteinerView.heightAnchor.constraint(equalToConstant: 100)
        ]
        
        let gameImageViewConstraints = [
            gameImageView.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 10),
            gameImageView.topAnchor.constraint(equalTo: conteinerView.topAnchor),
            gameImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            gameImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let titleGameLabelConstraints = [
            titleGameLabel.leadingAnchor.constraint(equalTo: gameImageView.trailingAnchor, constant: 10),
            titleGameLabel.topAnchor.constraint(equalTo: conteinerView.topAnchor, constant: 20),
        ]

        let subTitleGameLabelConstraints = [
            subTitleGameLabel.leadingAnchor.constraint(equalTo: titleGameLabel.leadingAnchor),
            subTitleGameLabel.topAnchor.constraint(equalTo: titleGameLabel.bottomAnchor, constant: 6),
            subTitleGameLabel.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -16),
        ]
        
        let gameCategoryButtonConstraints = [
            gameCategoryButton.leadingAnchor.constraint(equalTo: subTitleGameLabel.leadingAnchor),
            gameCategoryButton.topAnchor.constraint(equalTo: subTitleGameLabel.bottomAnchor, constant: 8),
            gameCategoryButton.bottomAnchor.constraint(lessThanOrEqualTo: conteinerView.bottomAnchor, constant: -16),
            gameCategoryButton.heightAnchor.constraint(equalToConstant: 16)
        ]
        
        NSLayoutConstraint.activate(containerViewConstraints)
        NSLayoutConstraint.activate(gameImageViewConstraints)
        NSLayoutConstraint.activate(titleGameLabelConstraints)
        NSLayoutConstraint.activate(subTitleGameLabelConstraints)
        NSLayoutConstraint.activate(gameCategoryButtonConstraints)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}


//
//  GameTableViewCell.swift
//  4free!
//
//  Created by Leonardo Macedo on 22/02/24.
//

import UIKit

class GamesTableViewCell: UITableViewCell {
    
    static let identifier = "GamesTableViewCell"
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: CGFloat(0x32) / 255.0, green: CGFloat(0x35) / 255.0, blue: CGFloat(0x38) / 255.0, alpha: 1.0)

        view.layer.cornerRadius = 6
        return view
    }()
    
    let isFreeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Free", for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.cornerRadius = 4
        return button
    }()

    let gameImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "cs2")
        return imageView
    }()
    
    let gameNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Counter-Strike 2"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .white
        return label
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(containerView)
        contentView.addSubview(gameImageView)
        contentView.addSubview(isFreeButton)
        contentView.addSubview(gameNameLabel)
        applyConstraints()
    }
    
    private func applyConstraints() {
            let containerViewConstraints = [
                containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            ]
            
            let gameImageViewConstraints = [
                gameImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                gameImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                gameImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: -30),
                gameImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor)
            ]
            
            let isFreeButtonConstraints = [
                isFreeButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
                isFreeButton.centerYAnchor.constraint(equalTo: gameNameLabel.centerYAnchor),
                isFreeButton.widthAnchor.constraint(equalToConstant: 50)
            ]
            
            let gameNameLabelConstraints = [
                gameNameLabel.leadingAnchor.constraint(equalTo: gameImageView.leadingAnchor, constant: 10),
                gameNameLabel.trailingAnchor.constraint(equalTo: isFreeButton.leadingAnchor, constant: -10),
                gameNameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12)
            ]
            
            NSLayoutConstraint.activate(containerViewConstraints)
            NSLayoutConstraint.activate(gameImageViewConstraints)
            NSLayoutConstraint.activate(isFreeButtonConstraints)
            NSLayoutConstraint.activate(gameNameLabelConstraints)
        }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}

//
//  GameUIView.swift
//  4free!
//
//  Created by Leonardo Macedo on 22/02/24.
//

import UIKit

class GameUIView: UIView {
    
    private let containerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Unlock Your Gaming Adventure: Explore Unlimited Free Games Now!"
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.alpha = 0.8
        label.numberOfLines = 0
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Dive into a vast selection of games tailored to your preferences. With endless options at your fingertips, finding your next gaming obsession is just a tap away. Explore, discover, and play to your heart's content – your next gaming adventure awaits!"
        label.font = .systemFont(ofSize: 14)
        label.alpha = 0.8
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let browseGamesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Browse Games", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0.3
        imageView.image = UIImage(named: "cs2")
        return imageView
    }()
        
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(containerView)
        addSubview(bannerImageView)
        addGradient()
        
        addSubview(browseGamesButton)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        applyConstraints()
        browseGamesButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    private func applyConstraints() {
        
        let containerViewConstraints = [
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        let bannerImageViewConstraints = [
            bannerImageView.topAnchor.constraint(equalTo: topAnchor),
            bannerImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            bannerImageView.heightAnchor.constraint(equalToConstant: 300)
        ]
        
        let titleLabelConstraints = [
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ]
        
        let subTitleLabelConstraints = [
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            subTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            subTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ]
        
        let browseGamesButtonConstraints = [
            browseGamesButton.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 30),
            browseGamesButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            browseGamesButton.widthAnchor.constraint(equalToConstant: 130),
            browseGamesButton.heightAnchor.constraint(equalToConstant: 40)
        ]

        
        NSLayoutConstraint.activate(containerViewConstraints)
        NSLayoutConstraint.activate(bannerImageViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(subTitleLabelConstraints)
        NSLayoutConstraint.activate(browseGamesButtonConstraints)
    }
    
    @objc private func didTapButton() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let sceneDelegate = windowScene.delegate as? SceneDelegate,
              let tabBarVC = sceneDelegate.window?.rootViewController as? MainTabBarViewController else {
            return
        }
        
        tabBarVC.selectedIndex = 3
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}


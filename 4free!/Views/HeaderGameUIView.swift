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
        label.text = "Explore and discover new free games to play!"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    } ()
    
    private let categoriesGamesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Browse Games", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 5
        return button
    } ()
    
    private let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0.3
        imageView.image = UIImage(named: "cs2")
        return imageView
    } ()
    
    private let principalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mais jogados Recentemente"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        return label
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
        
        addSubview(categoriesGamesButton)
        addSubview(titleLabel)
        addSubview(principalLabel)
        applyConstraints()
        categoriesGamesButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    private func applyConstraints() {
        
        let containerViewConstraints = [
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        let bannerImageViewConstraints = [
            bannerImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            bannerImageView.topAnchor.constraint(equalTo: topAnchor, constant: -40),
            bannerImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ]
        
        let titleLabelConstraints = [
            titleLabel.centerXAnchor.constraint(equalTo: bannerImageView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: bannerImageView.centerYAnchor)
        ]
        
        let categoriesGamesButtonConstraints = [
            categoriesGamesButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            categoriesGamesButton.centerXAnchor.constraint(equalTo: bannerImageView.centerXAnchor),
            categoriesGamesButton.widthAnchor.constraint(equalToConstant: 130),
            categoriesGamesButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        let principalLabelConstraints = [
            principalLabel.topAnchor.constraint(equalTo: bannerImageView.bottomAnchor, constant: -30),
            principalLabel.centerXAnchor.constraint(equalTo: bannerImageView.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(containerViewConstraints)
        NSLayoutConstraint.activate(bannerImageViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(categoriesGamesButtonConstraints)
        NSLayoutConstraint.activate(principalLabelConstraints)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bannerImageView.frame = bounds
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


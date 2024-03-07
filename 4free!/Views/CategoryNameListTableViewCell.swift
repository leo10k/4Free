//
//  CategoryNameListTableViewCell.swift
//  4free!
//
//  Created by Leonardo Macedo on 03/03/24.
//

import UIKit

class CategoryNameListTableViewCell: UITableViewCell {
    
    static let identifier = "CategoryNameListTableViewCell"
    
    let conteinerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: CGFloat(0x32) / 255.0, green: CGFloat(0x35) / 255.0, blue: CGFloat(0x38) / 255.0, alpha: 1.0)
        view.layer.cornerRadius = 6
        return view
    }()
    
    let categoryNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Category Name"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(conteinerView)
        contentView.addSubview(categoryNameLabel)
        applyConstraints()
        
    }
    
    private func applyConstraints() {
        
        let conteinerViewContraints = [
            conteinerView.topAnchor.constraint(equalTo: topAnchor),
            conteinerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            conteinerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10)
        ]
        
        let categoryNameLabelConstraints = [
            categoryNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            categoryNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(conteinerViewContraints)
        NSLayoutConstraint.activate(categoryNameLabelConstraints)
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

}

//
//  ListCell.swift
//  HomeWork13
//
//  Created by Ренат Сафин on 01.02.2022.
//

import UIKit

class ListCell: UICollectionViewCell {
    
    static let identifier = "ListCell"
    
    // MARK: - Views
    
    private lazy var iconContainer: UIView = {
        let iconContainer = UIView()
        return iconContainer
    }()
    
    private lazy var iconImageView: UIImageView = {
        var icon = UIImageView()
        icon.contentMode = .scaleAspectFill
        return icon
    }()
    
    private lazy var name: UILabel = {
        var name = UILabel()
        name.font = UIFont.preferredFont(forTextStyle: .title2)
        name.textColor = .label
        return name
    }()
    
    private lazy var coutnFotos: UILabel = {
        var countFotos = UILabel()
        countFotos.textAlignment = .right
        countFotos.tintColor = .secondaryLabel
        return countFotos
    }()
    
    private lazy var indicator: UIImageView = {
        let indicator = UIImageView()
        indicator.image = UIImage(systemName: "chevron.right")
        indicator.tintColor = .secondaryLabel
        return indicator
    }()
    
    private lazy var separator: UIView = {
        let separator = UIView(frame: .zero)
        separator.backgroundColor = .quaternaryLabel
        return separator
    }()
    
    private lazy var stackViewText: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [name, coutnFotos, indicator])
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.spacing = UIStackView.spacingUseSystem
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)
        return stackView
    }()
    
    private lazy var separatorStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [stackViewText, separator])
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [iconContainer, separatorStackView])
        stackView.axis = .horizontal
        return stackView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Settings
    
    private func setupHierarchy() {
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(stackView)
    }
    
    private func setupLayout() {
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor, constant: -5).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor).isActive = true

        iconContainer.translatesAutoresizingMaskIntoConstraints = false
        iconContainer.widthAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    public func configure(model: Album) {
        iconImageView.image = UIImage(systemName: model.imegeName)
        name.text = model.nameCell
        coutnFotos.text = String(model.countFotoToCell)
        separator.isHidden = false
    }
}



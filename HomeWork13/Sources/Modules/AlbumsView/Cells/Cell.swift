//
//  Cell.swift
//  HomeWork13
//
//  Created by Ренат Сафин on 30.01.2022.
//

import UIKit

class Cell: UICollectionViewCell {
    
    static let identifier = "FirstCollectionViewCell"
    
    // MARK: - Views
    
    private lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        var titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 16)
        titleLabel.textColor = .label
        return titleLabel
    }()
    
    private lazy var coutnFotos: UILabel = {
        var countFotos = UILabel()
        countFotos.font = .systemFont(ofSize: 16)
        countFotos.textColor = .secondaryLabel
        return countFotos
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, titleLabel, coutnFotos])
        stackView.axis = .vertical
        stackView.setCustomSpacing(-6, after: titleLabel)
        stackView.clipsToBounds = true
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
        contentView.addSubview(stackView)
    }
    
    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    public func configure(model: Album) {
        imageView.image = UIImage(named: model.imegeName)
        titleLabel.text = model.nameCell
        coutnFotos.text = model.countFotoToCell
    }
}

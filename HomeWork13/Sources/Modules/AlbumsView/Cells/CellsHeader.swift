//
//  CellsHeader.swift
//  HomeWork13
//
//  Created by Ренат Сафин on 31.01.2022.
//

import UIKit

class CellsHeader: UICollectionReusableView {
    
    static let identifier = "FirstCollectionViewHeader"
    
    // MARK: - Views
    
    private lazy var separator: UIView = {
        let separator = UIView(frame: .zero)
        separator.backgroundColor = .quaternaryLabel
        return separator
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: Metric.labelFont, weight: .bold)
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .link
        button.titleLabel?.font = UIFont.systemFont(ofSize: Metric.buttonTitleLabelFont)
        button.setTitle("См все", for: .normal)
        return button
    }()
    
    private lazy var stackViewLabelButton: UIStackView = {
        var stackView = UIStackView(arrangedSubviews: [label, button])
        stackView.axis = .horizontal
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
        return stackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [separator, stackViewLabelButton])
        stackView.axis = .vertical
        stackView.setCustomSpacing(Metric.stackViewSetCustomSpacing, after: separator)
        return stackView
    }()
    
    // MARK: - Init
    
    override func prepareForReuse() {
        label.text = nil
        button.setTitle(nil, for: .normal)
    }
    
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
        addSubview(stackView)
    }
    
    private func setupLayout() {
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.heightAnchor.constraint(equalToConstant: Metric.separatorHeightAnchor)
        
        stackViewLabelButton.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
}

// MARK: - Constants

extension CellsHeader {
    enum Metric {
        static let labelFont: CGFloat = 25
        static let buttonTitleLabelFont: CGFloat = 18
        static let stackViewSetCustomSpacing: CGFloat = 10
        static let separatorHeightAnchor: CGFloat = 1
    }
}

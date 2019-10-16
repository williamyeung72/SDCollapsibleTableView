//
//  TableHeaderView.swift
//  SDCollapsibleTableView_Example
//
//  Created by MAC on 16/10/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

protocol TableHeaderViewDelegate: NSObjectProtocol {
    func buttonDidPress(_ sectionIndex: Int)
}

final class TableHeaderView: UIView {
    
    weak var delegate: TableHeaderViewDelegate?
    var sectionIndex: Int = 0
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let headerButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        
        addSubview(titleLabel)
        addSubview(headerButton)
        
        headerButton.addTarget(self, action: #selector(buttonDidPress), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12)
        ])
        
        NSLayoutConstraint.activate([
            headerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            headerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            headerButton.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            headerButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ])
    }
    
    @objc func buttonDidPress() {
        delegate?.buttonDidPress(sectionIndex)
    }
}

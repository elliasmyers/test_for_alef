//
//  File.swift
//  Alef
//
//  Created by Raiden Yamato on 30.07.2023.
//

import UIKit

class ChildsSupplementaryView: UICollectionReusableView {
    let label = UILabel()
    let button = UIButton()
    static let reuseIdentifier = "personal-data-supplementary-reuse-identifier"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("no implenmentation for init coder in PersonalDataSupplementaryView")
    }
}


extension ChildsSupplementaryView {
    func configure() {
        addSubview(label)
        addSubview(button)
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        
        button.setTitle(" Добавить ребенка", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.systemCyan, for: .normal)
        button.layer.borderWidth = 2
        button.tintColor = .systemCyan
        button.layer.borderColor = CGColor(red: 1/255, green: 167/255, blue: 253/255, alpha: 1)
        button.layer.cornerRadius = 20
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        let inset = CGFloat(10)
        
        NSLayoutConstraint.activate([
 
            label.leadingAnchor.constraint(equalTo: leadingAnchor,constant: inset),
            label.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -inset),
            label.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset),
            
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -inset),
            button.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: 0),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
            
        ])
        label.font = UIFont.preferredFont(forTextStyle: .title3)
    }
}


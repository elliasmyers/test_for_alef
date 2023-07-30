//
//  PersonalDataView.swift
//  Alef
//
//  Created by Raiden Yamato on 30.07.2023.
//

import UIKit

class PersonalDataSupplementaryView: UICollectionReusableView {
    let label = UILabel()
    static let reuseIdentifier = "personal-data-supplementary-reuse-identifier"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("no implenmentation for init coder in PersonalDataSupplementaryView")
    }
}


extension PersonalDataSupplementaryView {
    func configure() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        let inset = CGFloat(10)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor,constant: inset),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
            label.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset)
        ])
        label.font = UIFont.preferredFont(forTextStyle: .title3)
    }
}





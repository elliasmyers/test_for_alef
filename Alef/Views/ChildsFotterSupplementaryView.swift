//
//  File.swift
//  Alef
//
//  Created by Raiden Yamato on 30.07.2023.
//

import UIKit

public protocol DeleteAllCells {
    func deleteAllCells()
}


class ChildsFotterSupplementaryView: UICollectionReusableView {
   
    var delgate: DeleteAllCells!
    
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


extension ChildsFotterSupplementaryView {
    func configure() {
       
        
        addSubview(button)
       
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Очистить", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.systemRed, for: .normal)
        button.layer.borderWidth = 2
       // button.tintColor = .systemRed
        button.layer.borderColor = CGColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
        button.layer.cornerRadius = 20
        
        button.addTarget(self, action: #selector(delegateMethodForDeleteAll(sender:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
 
            
            button.centerYAnchor.constraint(equalTo: centerYAnchor),
            button.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: 0),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.centerXAnchor.constraint(equalTo: centerXAnchor)
            
        ])
        
    }
    
    
    @objc func delegateMethodForDeleteAll(sender: UIButton) {
        delgate.deleteAllCells()
    }
    
}


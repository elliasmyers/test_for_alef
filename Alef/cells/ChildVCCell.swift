//
//  ChildVCCell.swift
//  Alef
//
//  Created by Raiden Yamato on 28.07.2023.
//

import UIKit

public protocol DeleteChildCellDelegate {
    func deleteChildCell(_ cell: CHildCVCell)
}

public class CHildCVCell: UICollectionViewCell {
    
    public var deleteCellDelegate: DeleteChildCellDelegate!
    
    public var nameTextField: UITextField!
    public var ageTextField: UITextField!
    
    public let button: UIButton = {
        let button = UIButton(type: .system)
//        button.frame = CGRect(x: 0, y: 0, width: 20, height: 10)
        button.setTitle("Удалить", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.systemCyan, for: .normal)
        return button
    }()
    
    
    
    public let nameLabel: UILabel = {
        let label = UILabel()
       // label.backgroundColor = .red
        label.text = "Имя"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    public let ageLabel: UILabel = {
        let label = UILabel()
       // label.backgroundColor = .red
        label.text = "Возраст"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    public let view1: UIView = {
        let v1 = UIView()
        v1.backgroundColor = .white
        v1.layer.cornerRadius = 5
        v1.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
        v1.layer.borderWidth = 2
        return v1
    }()
    
    public let view2: UIView = {
        let v2 = UIView()
        v2.backgroundColor = .white
        v2.layer.cornerRadius = 5
        v2.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
        v2.layer.borderWidth = 2
        return v2
    }()
    
    public let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5)
        return stackView
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        stackView.addArrangedSubview(view1)
        stackView.addArrangedSubview(view2)
        
        contentView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view1.addSubview(nameLabel)
        view2.addSubview(ageLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameTextField = TextFieldWithPadding(delegate: self, placeHolder: "Введите имя")
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        
//        nameTextField.backgroundColor = .cyan
        
        
        
        
        ageTextField = TextFieldWithPadding(delegate: self, placeHolder: "Введите возраст")
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
       
//        ageTextField.backgroundColor = .cyan
        
        view1.addSubview(nameTextField)
        view2.addSubview(ageTextField)
        
        
        button.addTarget(self, action: #selector(deleteCell(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(button)
        
        NSLayoutConstraint.activate([
            
            nameLabel.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: view1.topAnchor, constant: 10),
            
            nameTextField.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 20),
            nameTextField.bottomAnchor.constraint(equalTo: view1.bottomAnchor, constant: -10),
            nameTextField.widthAnchor.constraint(equalTo: view1.widthAnchor, constant: -40),
            
            ageLabel.leadingAnchor.constraint(equalTo: view2.leadingAnchor, constant: 20),
            ageLabel.topAnchor.constraint(equalTo: view2.topAnchor, constant: 10),
            
            ageTextField.leadingAnchor.constraint(equalTo: view2.leadingAnchor, constant: 20),
            ageTextField.bottomAnchor.constraint(equalTo: view2.bottomAnchor, constant: -10),
            ageTextField.widthAnchor.constraint(equalTo: view2.widthAnchor, constant: -40),
            
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: (contentView.frame.width / 2 ) + 5),
            button.centerYAnchor.constraint(equalTo: view1.centerYAnchor),
            
            view1.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5, constant: -10),
            view2.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5, constant: -10),
            
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
    
    @objc func deleteCell(sender: UIButton) {
        deleteCellDelegate.deleteChildCell(self)
    }
    
    
}


extension CHildCVCell: UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
}

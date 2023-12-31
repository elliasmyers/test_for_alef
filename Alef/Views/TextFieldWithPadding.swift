//
//  TextFieldWithPadding.swift
//  Alef
//
//  Created by Raiden Yamato on 26.07.2023.
//

import UIKit

class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(delegate: UITextFieldDelegate, placeHolder: String, frame: CGRect = .zero) {
        self.init(frame: frame)
        self.delegate = delegate
        self.placeholder = placeHolder
        self.frame = frame
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        font = .systemFont(ofSize: 16)
        textAlignment = .left
        contentVerticalAlignment = .center
        contentMode = .scaleToFill
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
}

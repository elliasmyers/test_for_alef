//
//  ViewController.swift
//  Alef
//
//  Created by Raiden Yamato on 26.07.2023.
//

import UIKit

class ViewController: UIViewController {

    
    static let userSectionHeaderElementKind = "user-section-header-element-kind"
    static let childSectionHeaderElementKind = "child-section-header-element-kind"
    static let childSectionFooterElementKind = "child-section-footer-element-kind"
    
    var collectionView: PDCollectionView!
    public let personalDataBuilder = PersonalDataBuilder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()    }

    override public func viewWillLayoutSubviews() {
        collectionView.frame = UIScreen.main.bounds
    }
    
    
    private func setupCollectionView() {
        collectionView = PDCollectionView(frame: UIScreen.main.bounds, layout: configureCollectionLayout(), personalDataBuilder: personalDataBuilder)
        view.addSubview(collectionView)
    }
   
}


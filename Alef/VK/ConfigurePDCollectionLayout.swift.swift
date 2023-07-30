//
//  ConfigurePDCollectionLayout.swift.swift
//  Alef
//
//  Created by Raiden Yamato on 26.07.2023.
//

import Foundation
import UIKit

public enum Section: Int, CaseIterable {
    case user
    case kid
    case clear
    
    var itemHeight: NSCollectionLayoutDimension {
        switch self {
        case .user:
            return .fractionalHeight(1.0)
        case .kid:
            return .fractionalHeight(1.0)
        case .clear:
            return .fractionalHeight(1.0)
        }
    }
    
    
    var groupheight: NSCollectionLayoutDimension {
        switch self {
        case .user:
            return .fractionalHeight(0.2)
        case .kid:
            return .fractionalHeight(0.2)
        case .clear:
            return .fractionalHeight(0.1)
        }
    }
    
    
//    var headerElementKind: String {
//        switch self {
//        case .user:
//            return ViewController.userSectionHeaderElementKind
//        case .kid:
//            return ViewController.childSectionHeaderElementKind
//        case .clear:
//            return ""
//        }
//    }
    
}


extension ViewController {
    
    func configureCollectionLayout() -> UICollectionViewLayout {
        
        let sectionProvider = { (sectionIndex: Int, layout: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            guard let sectionKind = Section(rawValue: sectionIndex) else { return nil }
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: sectionKind.itemHeight)
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: sectionKind.groupheight)
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 2
            section.contentInsets = NSDirectionalEdgeInsets(top: 17, leading: 17, bottom: 17, trailing: 17)
            
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
            if sectionKind == .user {
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: ViewController.userSectionHeaderElementKind, alignment: .top)
                section.boundarySupplementaryItems = [sectionHeader]
            } else if sectionKind == .kid {
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: ViewController.childSectionHeaderElementKind, alignment: .top)
                let sectionFooter = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: ViewController.childSectionFooterElementKind, alignment: .bottom)
                    section.boundarySupplementaryItems = [sectionHeader, sectionFooter]
                }
            
            
            return section
        }
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
        }
}


//
//  PDCollectionView.swift
//  Alef
//
//  Created by Raiden Yamato on 26.07.2023.
//

import Foundation
import UIKit

public class PDCollectionView: UICollectionView {
    
    public var personalDataBuilder: PersonalDataBuilder!
    
    fileprivate struct CellIdentifiers {
        fileprivate static let userCell = "UserCell"
        fileprivate static let kidCell = "KidCell"
        fileprivate static let clearCell = "ClearCell"
    }
    
    var diffableDataSource: UICollectionViewDiffableDataSource<Section, AnyHashable>!
    var snapshot: NSDiffableDataSourceSnapshot<Section, AnyHashable>!
    
    
    convenience init(frame: CGRect, layout: UICollectionViewLayout, personalDataBuilder: PersonalDataBuilder) {
        self.init(frame: frame, collectionViewLayout: layout)
        self.personalDataBuilder = personalDataBuilder
        configureCollection()
        configureDiffableDataSource()
        configureDiffableDataSourceSnapshot()
    }
    
    
    override public init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: UIScreen.main.bounds, collectionViewLayout: layout)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCollection() {
        backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        register(UserCVCell.self, forCellWithReuseIdentifier: CellIdentifiers.userCell)
        register(CHildCVCell.self, forCellWithReuseIdentifier: CellIdentifiers.kidCell)
        //register(         , forCellWithReuseIdentifier: CellIdentifiers.clearCell)
        
        self.delegate = self
        
    }
    
    
    func configureDiffableDataSource() {
        diffableDataSource = UICollectionViewDiffableDataSource(collectionView: self, cellProvider: { [self] collectionView, indexPath, item in
            if indexPath.section == 0 {
                let cell = userCell(from: self, for: indexPath)
                return configure(cell: cell)
                
            } else if indexPath.section == 1 {
                let cell = childCell(from: self, for: indexPath)
                return configure(cell: cell)
            } else {
                // just for testing
                return UICollectionViewCell()
            }
        })
        
        let userHeaderRegistration = UICollectionView.SupplementaryRegistration<PersonalDataSupplementaryView>(elementKind: ViewController.userSectionHeaderElementKind) { supplementaryView, elementKind, indexPath in
            supplementaryView.label.text = "Персональные данные"
        }
        
        let childsHeaderRegistration = UICollectionView.SupplementaryRegistration<ChildsSupplementaryView>(elementKind: ViewController.childSectionHeaderElementKind) { supplementaryView, elementKind, indexPath in
            supplementaryView.label.text = "Дети (макс.5)"
            supplementaryView.button.addTarget(self, action: #selector(self.addItem(sender:)), for: .touchUpInside)
        }
        
        
        let childFooterRegistration = UICollectionView.SupplementaryRegistration<ChildsFotterSupplementaryView>(elementKind: ViewController.childSectionFooterElementKind) { supplementaryView, elementKind, indexPath in
            supplementaryView.delgate = self
        }
        
        diffableDataSource.supplementaryViewProvider = { (view, kind, index) in
            
            switch kind {
            case ViewController.userSectionHeaderElementKind:
                return self.dequeueConfiguredReusableSupplementary(using:  userHeaderRegistration, for: index)
            case ViewController.childSectionHeaderElementKind:
                return self.dequeueConfiguredReusableSupplementary(using: childsHeaderRegistration, for: index)
            case ViewController.childSectionFooterElementKind:
                return self.dequeueConfiguredReusableSupplementary(using: childFooterRegistration, for: index)
            default:
                fatalError("supplementaryViewProvider error")
            }
            
        }
        
        
    }
    
    
    
    private func userCell(from collectionView: UICollectionView, for indexPath: IndexPath) -> UserCVCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: CellIdentifiers.userCell, for: indexPath) as? UserCVCell else { fatalError("Cannot create new title cell") }
        return cell
    }
    
    private func childCell(from: UICollectionView, for indexPath: IndexPath) -> CHildCVCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: CellIdentifiers.kidCell, for: indexPath) as? CHildCVCell else { fatalError("Cannot create new cell") }
            let childBuilder = childBuilder(for: indexPath)
        cell.nameTextField.text = childBuilder.name
        cell.ageTextField.text = childBuilder.age
        cell.deleteCellDelegate = self
       return cell
    }
    
    private func childBuilder(for indexPath: IndexPath) -> CHildBuider {
        return personalDataBuilder.kids[indexPath.row]
    }
    
    private func configure(cell: UICollectionViewCell) -> UICollectionViewCell {
      //  cell.backgroundColor = UIColor.red
        return cell
    }
    
    
    
    private func configureDiffableDataSourceSnapshot() {
        snapshot = NSDiffableDataSourceSnapshot<Section, AnyHashable>()
        snapshot.appendSections([.user, .kid, .clear])
        snapshot.appendItems(MockStruct.mock, toSection: .user)
        snapshot.appendItems(personalDataBuilder.kids, toSection: .kid)
        diffableDataSource.apply(snapshot, animatingDifferences: false)
    }
    
    
    @objc func addItem(sender: UIButton) {
        personalDataBuilder.addNewChild()
        configureDiffableDataSourceSnapshot()
    }
    
    
}

extension PDCollectionView: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /// continue
    }
}

extension PDCollectionView: DeleteChildCellDelegate {
    public func deleteChildCell(_ cell: CHildCVCell) {
        guard let indexPath = indexPath(for: cell)   //,
        //let deletedObject = diffableDataSource.itemIdentifier(for: indexPath
       // )
        else { return }
      //  var snapshot = diffableDataSource.snapshot()
       // snapshot.deleteItems([deletedObject])
       // diffableDataSource.apply(snapshot)
        personalDataBuilder.removeChild(at: indexPath.row)
        configureDiffableDataSourceSnapshot()
        print(personalDataBuilder.kids.count)
    }
}




extension PDCollectionView: DeleteAllCells {
    public func deleteAllCells() {
        
        let alertController = UIAlertController(title: "Внимание!", message: "Вы действительно хотите все удалить?", preferredStyle: UIAlertController.Style.actionSheet)
        
        let deleteAllAction = UIAlertAction(title: "Сбросить данные", style: .default) {[unowned self] action in
            self.personalDataBuilder.removeAll()
            self.configureDiffableDataSourceSnapshot()
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        
        alertController.addAction(deleteAllAction)
        alertController.addAction(cancelAction)
        
        parentViewController?.present(alertController, animated: true)

    }
    
    
    
}

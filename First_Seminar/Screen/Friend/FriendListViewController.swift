//
//  HomeViewController.swift
//  First_Seminar
//
//  Created by JEONGEUN KIM on 2022/10/13.
//

import UIKit
import SnapKit
import Then

class FriendListViewController: UIViewController{
    let list : [FriendList] = FriendList.list
    var dataSource : UICollectionViewDiffableDataSource<Sections, Item>!
    typealias Item = AnyHashable
    enum Sections: Int, CaseIterable, Hashable {
        case main
        case friendList
    }
    private lazy var collectionView = UICollectionView(frame:.zero, collectionViewLayout: createLayout()).then {
        $0.backgroundColor = .white
        $0.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        $0.delegate = self
    }
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setViews()
        setConstraints()
        register()
        setupDataSource()
        reloadData()
        
    }
    func setViews(){
        self.view.addSubview(collectionView)
    }
    func setConstraints(){
        collectionView.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalToSuperview()
            $0.top.equalTo(safeArea)
            $0.bottom.equalTo(safeArea)
        }
    }
    private func register() {
        collectionView.register(
            MainCell.self,
            forCellWithReuseIdentifier: MainCell.reuseId)
        collectionView.register(
            FriendListCell.self,
            forCellWithReuseIdentifier: FriendListCell.reuseId)
    }
    
    private func  setupDataSource(){
        dataSource = UICollectionViewDiffableDataSource<Sections, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            let section = Sections(rawValue: indexPath.section)!
            switch section{
            case .main :
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCell.reuseId, for: indexPath) as! MainCell
                return cell
            case .friendList :
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendListCell.reuseId, for: indexPath) as? FriendListCell  else { return UICollectionViewCell()}
                cell.config(item as! FriendList)
                return cell
            }
        })
    }
    private func reloadData(){
        var snapshot = NSDiffableDataSourceSnapshot<Sections,Item>()
        snapshot.appendSections([.main,.friendList])
        snapshot.appendItems(Array(0..<1),toSection: .main)
        snapshot.appendItems(list, toSection: .friendList)
        dataSource.apply(snapshot)
    }
    
  
    private func createLayout() -> UICollectionViewLayout {
      
            var config = UICollectionLayoutListConfiguration(appearance: .grouped)
            config.showsSeparators = false
            config.backgroundColor = .white
            config.trailingSwipeActionsConfigurationProvider = makeSwipeActions
            let layout =  UICollectionViewCompositionalLayout.list(using: config)
            return layout
      
    }
    private func makeSwipeActions(for indexPath: IndexPath?) -> UISwipeActionsConfiguration? {
        let deleteTitle = NSLocalizedString("삭제", comment: "Delete action title")
        let deleteAction = UIContextualAction(style: .destructive, title: deleteTitle) { [weak self] _, _, completion in
            completion(false)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
extension FriendListViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           let profileVC = ProfileViewController()
           profileVC.modalPresentationStyle = .fullScreen
           self.present(profileVC, animated: true, completion: nil)
    }
}

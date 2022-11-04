//
//  ChatViewController.swift
//  First_Seminar
//
//  Created by JEONGEUN KIM on 2022/11/04.
//

import UIKit

class ChatViewController: UIViewController {

    let list : [FriendList] = FriendList.list
    var dataSource : UICollectionViewDiffableDataSource<Sections, Item>!
    typealias Item = AnyHashable
    enum Sections :Int, CaseIterable, Hashable{
        case image
        case chat
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
            $0.directionalHorizontalEdges.equalTo(safeArea)
            $0.top.equalTo(safeArea).offset(5)
            $0.bottom.equalTo(safeArea)
        }
    }
    private func register() {
        collectionView.register(
            ImageCell.self,
            forCellWithReuseIdentifier: ImageCell.reuseId)
           collectionView.register(
               ChatCell.self,
               forCellWithReuseIdentifier: ChatCell.reuseId)
       }
    
    private func  setupDataSource(){
        dataSource = UICollectionViewDiffableDataSource<Sections, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            let section = Sections(rawValue: indexPath.section)!
            switch section{
            case .image :
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.reuseId, for: indexPath) as! ImageCell
                return cell
            case .chat :
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChatCell.reuseId, for: indexPath) as? ChatCell  else { return UICollectionViewCell()}
                cell.config(item as! FriendList)
                return cell
            }
        })
    }
    private func reloadData(){
        var snapshot = NSDiffableDataSourceSnapshot<Sections,Item>()
        snapshot.appendSections([.image,.chat])
        snapshot.appendItems(Array(0..<1),toSection: .image)
        snapshot.appendItems(list, toSection: .chat)
        dataSource.apply(snapshot)
    }
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(65))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 16)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(65))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        let config = UICollectionViewCompositionalLayoutConfiguration()
        return layout
    }
}
extension ChatViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        let profileVC = ProfileViewController()
        profileVC.modalPresentationStyle = .fullScreen
        self.present(profileVC, animated: true, completion: nil)
    }
}



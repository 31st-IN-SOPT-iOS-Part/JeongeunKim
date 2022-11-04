//
//  PhotoGridViewController.swift
//  First_Seminar
//
//  Created by JEONGEUN KIM on 2022/11/03.
//

import UIKit
import SnapKit
import Then

class PhotoGridViewController: UIViewController {
    var headerView : HeaderReusableView?
    let list : [PhtoList] = PhtoList.imageGrid
    var dataSource : UICollectionViewDiffableDataSource<Section, Item>!
    typealias Item = PhtoList
    enum Section{
        case main
    }
    lazy var collectionView = UICollectionView(frame:.zero, collectionViewLayout: createLayout()).then {
        $0.backgroundColor = .white
        $0.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        $0.delegate = self
        $0.allowsMultipleSelection = true
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
            $0.top.equalTo(safeArea)
            $0.bottom.equalTo(safeArea)
        }
    }
    private func register() {
        collectionView.register(
            PhotoCell.self,
            forCellWithReuseIdentifier: PhotoCell.reuseId)
        collectionView.register(HeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderReusableView.reuseId)
    }
    
    private func  setupDataSource(){
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { [self] collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseId, for: indexPath) as? PhotoCell  else { return UICollectionViewCell()}
            cell.config(item)
            cell.iconLabel.text = "\(indexPath.item)"
            return cell
        })
    }
    
    private func reloadData(){
        var snapshot = NSDiffableDataSourceSnapshot<Section,Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(list, toSection: .main)
        dataSource.apply(snapshot)
        dataSource.supplementaryViewProvider = { (collectionView, kind, indexPath) in
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderReusableView.reuseId, for: indexPath) as? HeaderReusableView else { return nil }
            header.btnDelegate = self
            header.numLabel.isHidden = true
            return header
        }
    }
    func createLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalWidth(0.33))
        let item = NSCollectionLayoutItem(layoutSize: itemSize )
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.33))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count:  3)
        group.interItemSpacing = .fixed(8)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 5
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,elementKind: UICollectionView.elementKindSectionHeader,alignment: .top)
        section.boundarySupplementaryItems = [header]
        return UICollectionViewCompositionalLayout(section: section)
    }
    
}
extension PhotoGridViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
}
extension PhotoGridViewController :btnDelegate {
    func action() {
        dismiss(animated: true)
    }
}

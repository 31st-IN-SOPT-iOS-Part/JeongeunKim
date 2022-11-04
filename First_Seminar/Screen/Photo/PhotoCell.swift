//
//  PhotoCell.swift
//  First_Seminar
//
//  Created by JEONGEUN KIM on 2022/11/04.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    static var reuseId: String = "PhotoCell"
    lazy var imageView = UIImageView().then {
        $0.image = UIImage(named: "Gallery/Frame 17")
        $0.contentMode = .scaleAspectFit
    }
   
    lazy var iconLabel = IconLabel(padding: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)).then {
        $0.text = "23"
        $0.textAlignment = .center
        $0.backgroundColor = .systemYellow
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        $0.isHidden = true
        
    }
    override var isSelected: Bool {
        didSet {
            self.imageView.layer.borderColor = isSelected ? UIColor.systemYellow.cgColor : UIColor.clear.cgColor
            self.imageView.layer.borderWidth = isSelected ? 5 : 0
            self.iconLabel.isHidden  = isSelected == true ? false : true
        }
    }
        override init(frame: CGRect){
            super.init(frame: frame)
            setView()
            setConstraints()
        }
  
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        func config(_ item : PhtoList){
            self.imageView.image = UIImage(named: item.image)
        }
        func setView(){
            self.contentView.addSubview(imageView)
            imageView.addSubview(iconLabel)
        }
        func setConstraints(){
            imageView.snp.makeConstraints {
                $0.directionalVerticalEdges.equalToSuperview()
                $0.directionalHorizontalEdges.equalToSuperview()
            }
            iconLabel.snp.makeConstraints {
                $0.trailing.equalToSuperview().inset(6)
                $0.top.equalToSuperview().offset(6)
                $0.height.width.equalTo(18)
            }
        }
    }


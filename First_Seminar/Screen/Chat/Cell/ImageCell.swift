//
//  ImageView.swift
//  First_Seminar
//
//  Created by JEONGEUN KIM on 2022/11/04.
//

import Foundation
import UIKit
import Then
import SnapKit

class ImageCell: UICollectionViewCell {
    static var reuseId: String = "ImageCell"

    private lazy var imageView = UIImageView().then {
        $0.image = UIImage(named: "sopt")
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 6
        $0.contentMode = .scaleAspectFill
    }
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setView(){
        
        self.addSubview(imageView)
    }
    func  setConstraints(){
        imageView.snp.makeConstraints {
            $0.height.equalTo(70)
            $0.directionalHorizontalEdges.equalToSuperview()
        }
    }
}

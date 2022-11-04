//
//  CustomBarItem.swift
//  First_Seminar
//
//  Created by JEONGEUN KIM on 2022/11/03.
//

import Foundation
import UIKit

final class CustomBarItem : UIButton {
    var handler: (() -> Void)?
    init(title : String? = nil, image: UIImage? = nil, handler:(() -> Void)?) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setImage(image, for: .normal)
        self.handler = handler
        self.addTarget(self, action: #selector(btntapped), for: .touchUpInside)
        setStyle()
    }
  
    private func  setStyle(){
        self.titleLabel?.font = .systemFont(ofSize: 22,weight: .bold)
        self.setTitleColor(.black, for: .normal)
        self.imageView?.tintColor = .black
    }
    
    @objc func btntapped(){
        handler?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

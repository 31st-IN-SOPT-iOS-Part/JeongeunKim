//
//  IconLabel.swift
//  First_Seminar
//
//  Created by JEONGEUN KIM on 2022/11/04.
//

import Foundation
import UIKit
import Then
import SnapKit

class IconLabel : UILabel {
    private var padding = UIEdgeInsets(top: 5, left:7, bottom: 5, right: 7)
        
    convenience init(padding: UIEdgeInsets ) {
        self.init()
        self.padding = padding
        self.layer.cornerRadius = 9
        self.textColor = .black
        self.textAlignment = .center
        self.backgroundColor = .systemYellow
        self.layer.masksToBounds = true
        self.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 10)
    }
    
        override func drawText(in rect: CGRect) {
            super.drawText(in: rect.inset(by: padding))
        }
        
        override var intrinsicContentSize: CGSize {
            var contentSize = super.intrinsicContentSize
            contentSize.height += padding.top + padding.bottom
            contentSize.width += padding.left + padding.right
            
            return contentSize
        }
}

//
//  HeaderReusableView.swift
//  First_Seminar
//
//  Created by JEONGEUN KIM on 2022/11/04.
//

import UIKit
protocol btnDelegate {
    func action()
}
class HeaderReusableView: UICollectionReusableView {
    var btnDelegate : btnDelegate?
    static var reuseId: String = "HeaderReusableView"
    let iconBtn = UIButton().then{
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.tintColor = .black
        
    }
     private let titleLabel = UILabel().then {
         $0.textColor = .black
         $0.text = "최근 항목"
         $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
         var paragraphStyle = NSMutableParagraphStyle()
         paragraphStyle.lineHeightMultiple = 0.83
    }
    private let sendLabel = UILabel().then {
        $0.text = "전송"
        $0.textColor = .black
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.95
   }
    let numLabel = UILabel().then {
        $0.text = "1"
        $0.textColor = .systemPink
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.95
   }
    override init(frame: CGRect) {
       
        super.init(frame: .zero)
        self.setViews()
        self.setConstraints()
        iconBtn.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc private func buttonDidTap() {
        self.btnDelegate?.action()
    }
    func setViews() {
        self.addSubview(iconBtn)
        self.addSubview(sendLabel)
        self.addSubview(titleLabel)
        self.addSubview(numLabel)
    }
    func setConstraints() {
        iconBtn.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(17)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(23)
            $0.width.equalTo(13)
        }
        numLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(sendLabel.snp.leading).offset(-10)
        }
        sendLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
    }
    func setNumtitle(_ num : String?){
        self.numLabel.text = num
    }

  
}

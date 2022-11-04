//
//  ChatCell.swift
//  First_Seminar
//
//  Created by JEONGEUN KIM on 2022/11/04.
//

import UIKit

class ChatCell: UICollectionViewCell {
    static var reuseId: String = "ChatCell"
    lazy var vStack = UIStackView(arrangedSubviews: [name,message]).then {
        $0.axis = .vertical
        $0.spacing = 6
    }
     var profileBtn = UIButton().then {
        $0.setImage(UIImage(named:"profileImage"), for: .normal)
        
    }
    lazy var name = UILabel().then {
        $0.textColor = UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 1)
        $0.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        $0.text = "김솝트"
    }
    lazy var message = UILabel().then {
        $0.textColor = UIColor(red: 0.651, green: 0.651, blue: 0.651, alpha: 1)
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 11)
        $0.text = "상태메세지는 여기에"
    }
    lazy var date = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 8)
        $0.textAlignment = .right
        $0.text = "오후 9:41"
    }
    override init(frame: CGRect){
        super.init(frame: frame)
        setView()
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func config(_ item : FriendList){
        self.profileBtn.setImage(UIImage(named: item.image), for: .normal)
        self.name.text = item.name
        self.message.text = item.message
        self.date.text = "오후 9:41"
    }
    func setView(){
        self.contentView.addSubview(profileBtn)
        self.contentView.addSubview(vStack)
        self.contentView.addSubview(date)
    }
    func setConstraints(){
        profileBtn.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(59)
            $0.height.equalTo(58)
        }
        vStack.snp.makeConstraints {
            $0.centerY.equalTo(profileBtn)
            $0.leading.equalTo(profileBtn.snp.trailing).offset(11)
            $0.width.equalTo(100)
            $0.height.equalTo(40)
        }
        date.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}

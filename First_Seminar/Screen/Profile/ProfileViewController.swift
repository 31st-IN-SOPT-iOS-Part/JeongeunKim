//
//  ProfileViewController.swift
//  First_Seminar
//
//  Created by JEONGEUN KIM on 2022/10/13.
//

import UIKit
import Then
import SnapKit

class ProfileViewController: UIViewController {
    lazy var hStack = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.addArrangedSubview(chatBtn)
        $0.addArrangedSubview(editBtn)
        $0.addArrangedSubview(storyBtn)
    }
    
    lazy var vStack = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 8
        $0.addArrangedSubview(userProfile)
        $0.addArrangedSubview(userName)
    }

    lazy var deleteBtn = UIButton(configuration: .filled()).then {
        $0.configuration?.image = UIImage(systemName: "xmark")
        $0.configuration?.baseBackgroundColor = .clear
        $0.addTarget(self, action: #selector(tappedBackBtn), for: .touchUpInside)
    }
    lazy var userProfile = UIImageView().then {
        $0.image = UIImage(named: "Profile/user")
        $0.contentMode = .scaleAspectFit
    }
    lazy var userName = UILabel().then {
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 18)
        $0.textAlignment = .center
        $0.text = "씬델리"
        $0.textColor = .white
    }
    lazy var chatBtn = UIButton(configuration: .filled()).then {
        $0.configuration?.subtitle = "나와의 채팅"
        $0.titleLabel!.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 10)
        $0.configuration?.image = UIImage(systemName: "message.fill")
        $0.configuration?.imagePadding = 8
        $0.configuration?.imagePlacement = NSDirectionalRectEdge.top
        $0.configuration?.baseBackgroundColor = .clear

    }
    lazy var editBtn =  UIButton(configuration: .filled()).then {
        $0.configuration?.subtitle = "프로필 편집"
        $0.titleLabel!.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 10)
        $0.configuration?.image = UIImage(named: "Profile/edit")
        $0.configuration?.imagePadding = 8
        $0.configuration?.imagePlacement = NSDirectionalRectEdge.top
        $0.configuration?.baseBackgroundColor = .clear
        
    }
    lazy var storyBtn =  UIButton(configuration: .filled()).then {
        $0.configuration?.subtitle = "카카오스토리"
        $0.titleLabel!.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 10)
        $0.configuration?.image = UIImage(named:"Profile/story")
        $0.configuration?.imagePadding = 8
        $0.configuration?.imagePlacement = NSDirectionalRectEdge.top
        $0.configuration?.baseBackgroundColor = .clear
    }
    lazy var lineLabel = UILabel().then {
        $0.backgroundColor = .white
    }
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.118, green: 0.118, blue: 0.118, alpha: 1)
        setViews()
        setConstrains()
    }
    func setViews(){
        self.view.addSubview(deleteBtn)
        self.view.addSubview(hStack)
        self.view.addSubview(vStack)
        self.view.addSubview(lineLabel)
        
    }
    func setConstrains(){
        deleteBtn.snp.makeConstraints {
            $0.top.equalTo(safeArea).offset(58)
            $0.leading.equalTo(safeArea).offset(18)
        }
        userProfile.snp.makeConstraints {
            $0.width.equalTo(97)
            $0.height.equalTo(96)
        }
        vStack.snp.makeConstraints {
           
            $0.centerX.equalTo(safeArea)
            $0.bottom.equalTo(safeArea).inset(202)
        }
        
        hStack.snp.makeConstraints {
            $0.top.equalTo(vStack.snp.bottom).offset(71)
            $0.centerX.equalTo(safeArea)
        }
        lineLabel.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.directionalHorizontalEdges.equalTo(safeArea)
            $0.top.equalTo(vStack.snp.bottom).offset(42)
        }
    }
 
    @objc func tappedBackBtn(){
        self.dismiss(animated: true, completion: nil)
    }
}

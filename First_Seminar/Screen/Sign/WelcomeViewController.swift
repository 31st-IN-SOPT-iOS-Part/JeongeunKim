//
//  ThirdViewController.swift
//  First_Seminar
//
//  Created by 김정은 on 2022/10/04.
//

import UIKit
import Then
import SnapKit

class WelcomeViewController: UIViewController {
    private lazy var titleLabel = UILabel().then {
        $0.text = "씬델리님 \n환영합니다"
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 22)
    }
    private lazy var accountBtn = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        $0.layer.cornerRadius = 4
        $0.layer.backgroundColor = UIColor.systemYellow.cgColor
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.addTarget(self, action: #selector(tappedBackBtn), for: .touchUpInside)
    }
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        setVeiws()
        setConstrains()
    }
    func setVeiws(){
        view.addSubview(titleLabel)
        view.addSubview(accountBtn)
    }
    func setConstrains(){
        titleLabel.snp.makeConstraints {
            $0.centerX.equalTo(safeArea)
            $0.centerY.equalTo(safeArea).offset(-50)
        }
        
        accountBtn.snp.makeConstraints {
            $0.centerX.equalTo(safeArea)
            $0.top.equalTo(titleLabel.snp.bottom).offset(100)
            $0.directionalHorizontalEdges.equalTo(safeArea).inset(20)
            $0.height.equalTo(60)
        }
   
    }
    func dataBind(result : String){
        if result == "" {
            titleLabel.text = "씬델리님 \n환영합니다"
        } else {
        titleLabel.text = "\(result)님 \n환영합니다"
        }
    }
    @objc func tappedBackBtn(){
        changeRootViewController(FriendListViewController())
    }
}

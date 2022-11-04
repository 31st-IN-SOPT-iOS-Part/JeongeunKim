//
//  SecondViewController.swift
//  First_Seminar
//
//  Created by 김정은 on 2022/10/04.
//

import UIKit
import Then
import SnapKit

class SignUpViewController: UIViewController {
    private lazy var loginStackView = UIStackView(arrangedSubviews: [idTextField,pwdTextField,pwdCheckTextField]).then {
        $0.axis = .vertical
        $0.spacing = 20
        $0.distribution = .fillEqually
    }
    private lazy var titleLabel = UILabel().then {
        $0.text = "카카오톡을 시작합니다"
        $0.font = UIFont.boldSystemFont(ofSize: 22)
        $0.textAlignment = .center
    }
    private lazy var idTextField = UITextField().then {
        $0.placeholder = "이메일 또는 전화번호"
    }
    private lazy var pwdTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.isSecureTextEntry = true
    }
    private lazy var pwdCheckTextField = UITextField().then {
        $0.placeholder = "비밀번호 확인"
        $0.isSecureTextEntry = true
    }
    private lazy var accountBtn = UIButton().then {
        $0.setTitle("새로운 카카오계정 만들기", for: .normal)
        $0.layer.cornerRadius = 4
        $0.layer.backgroundColor = UIColor.systemGray6.cgColor
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        $0.addTarget(self, action: #selector(tappedPresentBtn), for: .touchUpInside)
    }
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setViews()
        setConstrains()
    }
    
    func setViews(){
        view.addSubview(titleLabel)
        view.addSubview(loginStackView)
        view.addSubview(accountBtn)
    }
    func setConstrains(){
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.centerX.equalToSuperview()
        }
       
        loginStackView.snp.makeConstraints {
            $0.centerX.equalTo(safeArea)
            $0.leading.equalTo(safeArea).offset(20)
            $0.trailing.equalTo(safeArea).offset(-20)
            $0.top.equalTo(safeArea).offset(285)
            $0.height.equalTo(160)
        }
        accountBtn.snp.makeConstraints {
            $0.centerX.equalTo(safeArea)
            $0.top.equalTo(loginStackView.snp.bottom).offset(50)
            $0.directionalHorizontalEdges.equalTo(safeArea).inset(20)
            $0.height.equalTo(60)
        }
    }
    private func presentToThirdVC(){
        let welcomeVC = WelcomeViewController()
        welcomeVC.modalPresentationStyle = .fullScreen
        guard let userId = idTextField.text else { return }
        welcomeVC.dataBind(result :userId)
        self.present(welcomeVC, animated: true, completion: nil)
    }
    @objc private func tappedPresentBtn(){
        presentToThirdVC()
    }

}

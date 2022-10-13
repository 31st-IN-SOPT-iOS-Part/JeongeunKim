//
//  ViewController.swift
//  First_Seminar
//
//  Created by 김정은 on 2022/10/04.
//

import UIKit
import Then
import SnapKit

class SignInViewController: UIViewController {
    private lazy var titlestackView = UIStackView(arrangedSubviews: [titleLabel,subTitleLabel]).then{
        $0.axis = .vertical
        $0.spacing = 20
    }
    private lazy var loginStackView = UIStackView(arrangedSubviews: [idTextField,pwdTextField]).then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 20
    }
    private lazy var stackView = UIStackView(arrangedSubviews: [loginBtn,accountBtn,fetchLabel]).then {
        $0.axis = .vertical
        $0.spacing = 16
        $0.distribution = .fillEqually
    }
    private lazy var titleLabel = UILabel().then {
        $0.text = "카카오톡을 시작합니다"
        $0.font = UIFont.boldSystemFont(ofSize: 22)
        $0.textAlignment = .center
 
    }
    private lazy var subTitleLabel = UILabel().then {
        $0.text = "사용하던 카카오 계정이 있다면\n 이메일 또는 전화번호로 로그인해 주세요."
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    private lazy var idTextField = UITextField().then {
        $0.placeholder = "이메일 또는 전화번호"
    }
    private lazy var pwdTextField = UITextField().then  {
        $0.placeholder = "비밀번호"
        $0.isSecureTextEntry = true
    }
    private lazy var loginBtn = UIButton().then {
        $0.setTitle("카카오계정 로그인", for: .normal)
        $0.layer.cornerRadius = 4
        $0.layer.backgroundColor = UIColor.systemGray6.cgColor
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        $0.addTarget(self, action: #selector(tappedPresentBtn), for: .touchUpInside)
    }
    private lazy var accountBtn = UIButton().then {
        $0.setTitle("새로운 카카오계정 만들기", for: .normal)
        $0.layer.cornerRadius = 4
        $0.layer.backgroundColor = UIColor.systemGray6.cgColor
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        $0.addTarget(self, action: #selector(tappedPushBtn), for: .touchUpInside)
    }
    private lazy var fetchLabel = UILabel().then {
        $0.text = "카카오계정 또는 비밀번호 찾기"
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textAlignment = .center
    }
    private lazy var safeArea = self.view.safeAreaLayoutGuide

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setViews()
        setConstrains()
        
    }
   

    func setViews(){
        view.addSubview(titlestackView)
        view.addSubview(loginStackView)
        view.addSubview(stackView)
    }
    func setConstrains(){
        titlestackView.snp.makeConstraints {
            $0.centerX.equalTo(safeArea)
            $0.top.equalTo(safeArea).offset(100)
            $0.height.equalTo(85)
        }
        loginStackView.snp.makeConstraints {
            $0.centerX.equalTo(safeArea)
            $0.directionalHorizontalEdges.equalTo(safeArea).inset(20)
            $0.top.equalTo(titlestackView.snp.bottom).offset(100)
            $0.height.equalTo(100)
        }
   
        stackView.snp.makeConstraints {
            $0.centerX.equalTo(safeArea)
            $0.top.equalTo(loginStackView.snp.bottom).offset(50)
            $0.leading.equalTo(safeArea).offset(20)
            $0.trailing.equalTo(safeArea).offset(-20)
            $0.height.equalTo(220)
        }
    }
  
    private func presentToThirdVC(){
        let welcomeVC = WelcomeViewController()
        welcomeVC.modalPresentationStyle = .fullScreen
        guard let userId = idTextField.text else { return }
        welcomeVC.dataBind(result :userId)
        self.present(welcomeVC, animated: true, completion: nil)
    }
    private func pushToSecondVC(){
        let signUpVC = SignUpViewController()
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    @objc private func tappedPushBtn(){
        pushToSecondVC()
    }
    @objc private func tappedPresentBtn(){
        presentToThirdVC()
    }
}


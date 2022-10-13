//
//  ViewController.swift
//  First_Seminar
//
//  Created by 김정은 on 2022/10/04.
//

import UIKit

class ViewController: UIViewController {
    private lazy var titlestackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    private lazy var loginStackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 20
        return stack
    }()
    private lazy var stackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fillEqually
        return stack
    }()
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()
    private lazy var subTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "사용하던 카카오 계정이 있다면\n 이메일 또는 전화번호로 로그인해 주세요."
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    private lazy var idTextField : UITextField = {
        let text = UITextField()
        text.placeholder = "이메일 또는 전화번호"
        return text
    }()
    private lazy var pwdTextField : UITextField = {
        let text = UITextField()
        text.placeholder = "비밀번호"
        text.isSecureTextEntry = true
        
        return text
    }()
    private lazy var loginBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("카카오계정 로그인", for: .normal)
        btn.layer.cornerRadius = 4
        btn.layer.backgroundColor = UIColor.systemGray6.cgColor
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(tappedPresentBtn), for: .touchUpInside)
        return btn
    }()
    private lazy var accountBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("새로운 카카오계정 만들기", for: .normal)
        btn.layer.cornerRadius = 4
        btn.layer.backgroundColor = UIColor.systemGray6.cgColor
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(tappedPushBtn), for: .touchUpInside)
        return btn
    }()
    private lazy var fetchLabel : UILabel = {
        let label = UILabel()
        label.text = "카카오계정 또는 비밀번호 찾기"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setViews()
        setConstrains()
        
    }
   

    func setViews(){
        view.addSubview(titlestackView)
        titlestackView.addArrangedSubview(titleLabel)
        titlestackView.addArrangedSubview(subTitleLabel)
        view.addSubview(loginStackView)
        loginStackView.addArrangedSubview(idTextField)
        loginStackView.addArrangedSubview(pwdTextField)
        view.addSubview(stackView)
        stackView.addArrangedSubview(loginBtn)
        stackView.addArrangedSubview(accountBtn)
        stackView.addArrangedSubview(fetchLabel)
        
    }
    func setConstrains(){
        
        titlestackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        pwdTextField.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        accountBtn.translatesAutoresizingMaskIntoConstraints = false
        fetchLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titlestackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titlestackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titlestackView.heightAnchor.constraint(equalToConstant: 85),
            
            loginStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -20),
            loginStackView.topAnchor.constraint(equalTo: titlestackView.bottomAnchor, constant: 100),
            loginStackView.heightAnchor.constraint(equalToConstant: 100),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: loginStackView.bottomAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -20),
            stackView.heightAnchor.constraint(equalToConstant: 220)
         
        ])
    }
  
    private func presentToThirdVC(){
        let thirdVC = ThirdViewController()
        thirdVC.modalPresentationStyle = .fullScreen
        guard let userId = idTextField.text else { return }
        thirdVC.dataBind(result :userId)
        self.present(thirdVC, animated: true, completion: nil)
    }
    private func pushToSecondVC(){
        let secondVC = SecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    @objc private func tappedPushBtn(){
        pushToSecondVC()
    }
    @objc private func tappedPresentBtn(){
        presentToThirdVC()
    }
}


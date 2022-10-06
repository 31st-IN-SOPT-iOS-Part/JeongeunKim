//
//  SecondViewController.swift
//  First_Seminar
//
//  Created by 김정은 on 2022/10/04.
//

import UIKit

class SecondViewController: UIViewController {
    private lazy var loginStackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
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
    private lazy var pwdCheckTextField : UITextField = {
        let text = UITextField()
        text.placeholder = "비밀번호 확인"
        text.isSecureTextEntry = true
        return text
    }()
    private lazy var accountBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("새로운 카카오계정 만들기", for: .normal)
        btn.layer.cornerRadius = 4
        btn.layer.backgroundColor = UIColor.systemGray6.cgColor
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(tappedPresentBtn), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setViews()
        setConstrains()
    }
    
    func setViews(){
        view.addSubview(titleLabel)
        view.addSubview(loginStackView)
        loginStackView.addArrangedSubview(idTextField)
        loginStackView.addArrangedSubview(pwdTextField)
        loginStackView.addArrangedSubview(pwdCheckTextField)
        view.addSubview(accountBtn)
    }
    func setConstrains(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        pwdTextField.translatesAutoresizingMaskIntoConstraints = false
        pwdCheckTextField.translatesAutoresizingMaskIntoConstraints = false
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        accountBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor , constant:  100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -20),
            loginStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 285),
            loginStackView.heightAnchor.constraint(equalToConstant: 160),
            
            accountBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            accountBtn.topAnchor.constraint(equalTo: loginStackView.bottomAnchor, constant: 50),
            accountBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  20),
            accountBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -20),
            accountBtn.heightAnchor.constraint(equalToConstant: 60)
            
         
        ])
    }
    private func presentToThirdVC(){
        let thirdVC = ThirdViewController()
        thirdVC.modalPresentationStyle = .fullScreen
        guard let userId = idTextField.text else { return }
        thirdVC.dataBind(result :userId)
        self.present(thirdVC, animated: true, completion: nil)
    }
    @objc private func tappedPresentBtn(){
        presentToThirdVC()
    }

}

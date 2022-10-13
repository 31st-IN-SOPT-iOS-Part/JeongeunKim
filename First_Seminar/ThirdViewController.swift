//
//  ThirdViewController.swift
//  First_Seminar
//
//  Created by 김정은 on 2022/10/04.
//

import UIKit

class ThirdViewController: UIViewController {
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "n/a님 \n환영합니다"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    private lazy var accountBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("확인", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.layer.cornerRadius = 4
        btn.layer.backgroundColor = UIColor.systemYellow.cgColor
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(tappedBackBtn), for: .touchUpInside)
        return btn
    }()

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
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        accountBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor , constant: -50),
            accountBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            accountBtn.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
            accountBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  20),
            accountBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -20),
            accountBtn.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    func dataBind(result : String){
        if result == "" {
            titleLabel.text = "n/a님 \n환영합니다"
        } else {
        titleLabel.text = "\(result)님 \n환영합니다"
        }
    }
    @objc func tappedBackBtn(){
        self.dismiss(animated: true, completion: nil)
    }
}

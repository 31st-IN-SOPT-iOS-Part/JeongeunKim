//
//  HomeViewController.swift
//  First_Seminar
//
//  Created by JEONGEUN KIM on 2022/10/13.
//

import UIKit
import SnapKit
import Then

class HomeViewController: UIViewController {
    // MARK: UIView
    lazy var hStack = UIStackView().then {
        $0.backgroundColor = .white
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.addArrangedSubview(titleLabel)
        $0.addArrangedSubview(titleIcon)
    }
    lazy var titleLabel = UILabel().then {
        $0.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 22)
        $0.text = "친구"
    }
    lazy var titleIcon = UIImageView().then{
        $0.image = UIImage(systemName: "gearshape")
        $0.tintColor = .black
        $0.contentMode = .scaleAspectFit
    }
    lazy var profileBtn = UIButton(configuration: .filled()).then {
        $0.configuration?.image = UIImage(named:"profileImage")
        $0.configuration?.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0)
        $0.configuration?.baseBackgroundColor = .clear
        $0.addTarget(self, action: #selector(tappedPresentBtn), for: .touchUpInside)
    }
    private lazy var safeArea = self.view.safeAreaLayoutGuide

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstrains()
       
    }
    
    func setViews(){
        view.backgroundColor = .white
        self.view.addSubview(hStack)
        self.view.addSubview(profileBtn)
      
    }
    func setConstrains(){
        hStack.snp.makeConstraints {
            $0.top.equalTo(safeArea).offset(56)
            $0.leading.equalTo(safeArea).offset(14)
        }
        profileBtn.snp.makeConstraints {
            $0.top.equalTo(hStack.snp.bottom).offset(30)
            $0.leading.equalTo(hStack)
        }
    }
    private func presentToProfileVC(){
        let profileVC = ProfileViewController()
        profileVC.modalPresentationStyle = .fullScreen
        self.present(profileVC, animated: true, completion: nil)
    }
    @objc private func tappedPresentBtn(){
        presentToProfileVC()
      
    }
                     
}

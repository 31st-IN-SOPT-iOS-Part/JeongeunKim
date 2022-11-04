//
//  TabBarController.swift
//  First_Seminar
//
//  Created by JEONGEUN KIM on 2022/11/03.
//

import UIKit

class KakaoTabbar: UITabBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class KakaoTabbarController: UITabBarController {
    
    let imageNames = [
        "iconTabPersonUnfilled",
        "iconTabChatUnfilled",
        "iconTabSharpUnfilled",
        "iconTabShopUnfilled",
        "iconTabMoreUnfilled"
    ]
    
    let imageSelectedNames = [
        "iconTabPersonFilled",
        "iconTabChatFilled",
        "iconTabSharpFilled",
        "iconTabShopFilled",
        "iconTabMoreFilled"
    ]
    
    var defaultIndex = 0 {
        didSet {
            self.selectedIndex = defaultIndex
        }
    }
    
    private let kakaoTabbar = KakaoTabbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let title = CustomBarItem(title: "친구", handler: {})
        let titleItem = UIBarButtonItem(customView: title)
        let gear = CustomBarItem(image: UIImage(systemName: "gearshape"), handler: {print("tapped")})
        let gearItem = UIBarButtonItem(customView: gear)
        navigationItem.leftBarButtonItem = titleItem
        navigationItem.rightBarButtonItems = [gearItem]
        self.view.backgroundColor = .white
        self.selectedIndex = defaultIndex
        self.setValue(kakaoTabbar, forKey: "tabBar")
        object_setClass(self.tabBar, KakaoTabbar.self)
        self.tabBar.itemPositioning = .centered
    }

    }


extension KakaoTabbarController : UITabBarControllerDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let friendViewController = FriendListViewController()
        let friendNavigationController =  UINavigationController(rootViewController: friendViewController)
        friendNavigationController.navigationBar.isHidden = true
        
        let chatViewController = ChatViewController()
        let chatNavigationController = UINavigationController(rootViewController: chatViewController)
        chatNavigationController.navigationBar.isHidden = true
        
        let sharpViewController = SharpViewController()
        let sharpNavigationController = UINavigationController(rootViewController: sharpViewController)
        sharpNavigationController.navigationBar.isHidden = true
        
        let shopViewController = ShopViewController()
        let shopNavigationController = UINavigationController(rootViewController: shopViewController)
        shopNavigationController.navigationBar.isHidden = true
        
        let moreViewController = MoreViewController()
        let moreNavigationController = UINavigationController(rootViewController: moreViewController)
        moreNavigationController.navigationBar.isHidden = true
        
      
        let viewControllers = [
            friendNavigationController,
            chatNavigationController,
            sharpNavigationController,
            shopNavigationController,
            moreNavigationController,
        ]
        
        self.setViewControllers(viewControllers, animated: true)
        
        let tabBar: UITabBar = self.tabBar
        tabBar.backgroundColor = UIColor.white
        tabBar.barStyle = UIBarStyle.default
        tabBar.barTintColor = UIColor.white
        
        for (index, value) in (tabBar.items?.enumerated())! {
            let tabBarItem: UITabBarItem = value as UITabBarItem
            tabBarItem.image = UIImage(named: imageNames[index])?.withRenderingMode(.alwaysOriginal)
            tabBarItem.selectedImage = UIImage(named: imageSelectedNames[index])?.withRenderingMode(.alwaysOriginal)
            tabBarItem.accessibilityIdentifier = imageNames[index]
        }
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
      
        if item.accessibilityIdentifier == imageNames[0] {
            let title = CustomBarItem(title: "친구", handler: {})
            let titleItem = UIBarButtonItem(customView: title)
            let gear = CustomBarItem(image: UIImage(systemName: "gearshape"), handler: {print("tapped")})
            let gearItem = UIBarButtonItem(customView: gear)
            navigationItem.leftBarButtonItems = [titleItem]
            navigationItem.rightBarButtonItems = [gearItem]
        }else if item.accessibilityIdentifier == imageNames[1]{
            let title = CustomBarItem(title: "채팅", handler: {})
            let titleItem = UIBarButtonItem(customView: title)
            let title1 = CustomBarItem(title: "오픈 채팅", handler: {})
            title1.setTitleColor(.systemGray4, for: .normal)
            let titleItem1 = UIBarButtonItem(customView: title1)
            let plus = CustomBarItem(image: UIImage(systemName: "plus"), handler: {
                
                let photoVC = PhotoGridViewController()
                photoVC.modalPresentationStyle = .fullScreen
                self.present(photoVC, animated: true)
                
            })
            NSLayoutConstraint.activate([plus.widthAnchor.constraint(equalToConstant: 30)])
            let plusItem = UIBarButtonItem(customView: plus)
            let gear = CustomBarItem(image: UIImage(systemName: "gearshape"), handler: {print("tapped")})
            NSLayoutConstraint.activate([plus.widthAnchor.constraint(equalToConstant: 30)])
            let gearItem = UIBarButtonItem(customView: gear)
            navigationItem.leftBarButtonItems = [titleItem,titleItem1]
            navigationItem.rightBarButtonItems = [gearItem,plusItem]
        }else if item.accessibilityIdentifier == imageNames[2]{
            let title = CustomBarItem(title: "뷰", handler: {})
            let titleItem = UIBarButtonItem(customView: title)
            let magnif = CustomBarItem(image: UIImage(systemName: "magnifyingglass"), handler: {print("tapped")})
            NSLayoutConstraint.activate([magnif.widthAnchor.constraint(equalToConstant: 30)])
            let magnifItem = UIBarButtonItem(customView: magnif)
            let gear = CustomBarItem(image: UIImage(systemName: "gearshape"), handler: {print("tapped")})
            NSLayoutConstraint.activate([gear.widthAnchor.constraint(equalToConstant: 30)])
            let gearItem = UIBarButtonItem(customView: gear)
            navigationItem.leftBarButtonItems = [titleItem]
            navigationItem.rightBarButtonItems = [gearItem,magnifItem]
        } else if item.accessibilityIdentifier == imageNames[3]{
            let title = CustomBarItem(title: "쇼핑", handler: {})
            let titleItem = UIBarButtonItem(customView: title)
            let qr = CustomBarItem(image: UIImage(systemName: "viewfinder"), handler: {print("tapped")})
            NSLayoutConstraint.activate([qr.widthAnchor.constraint(equalToConstant: 30)])
            let qrItem = UIBarButtonItem(customView: qr)
            let gear = CustomBarItem(image: UIImage(systemName: "gearshape"), handler: {print("tapped")})
            NSLayoutConstraint.activate([gear.widthAnchor.constraint(equalToConstant: 30)])
            let gearItem = UIBarButtonItem(customView: gear)
            navigationItem.leftBarButtonItems = [titleItem]
            navigationItem.rightBarButtonItems = [gearItem,qrItem]
        } else if item.accessibilityIdentifier == imageNames[4]{
            let title = CustomBarItem(title: "더보기", handler: {})
            let titleItem = UIBarButtonItem(customView: title)
            let magnif = CustomBarItem(image: UIImage(systemName: "magnifyingglass"), handler: {print("tapped")})
            NSLayoutConstraint.activate([magnif.widthAnchor.constraint(equalToConstant: 30)])
            let magnifItem = UIBarButtonItem(customView: magnif)
            let qr = CustomBarItem(image: UIImage(systemName: "viewfinder"), handler: {print("tapped")})
            NSLayoutConstraint.activate([qr.widthAnchor.constraint(equalToConstant: 30)])
            let qrItem = UIBarButtonItem(customView: qr)
            let gear = CustomBarItem(image: UIImage(systemName: "gearshape"), handler: {print("tapped")})
            NSLayoutConstraint.activate([gear.widthAnchor.constraint(equalToConstant: 30)])
            let gearItem = UIBarButtonItem(customView: gear)
            navigationItem.leftBarButtonItems = [titleItem]
            navigationItem.rightBarButtonItems = [gearItem,qrItem,magnifItem,]
        }
        }
        
    
}

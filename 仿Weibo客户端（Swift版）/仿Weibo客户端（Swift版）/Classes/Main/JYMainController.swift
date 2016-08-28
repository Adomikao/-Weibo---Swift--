//
//  JYMainController.swift
//  仿Weibo客户端（Swift版）
//
//  Created by yongjianyu on 16/8/28.
//  Copyright © 2016年 Adomikao Inc. All rights reserved.
//

import UIKit

class JYMainController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //
        tabBar.tintColor = UIColor.orangeColor()
        // 2.添加子控制器
        addChildController(JYHomeViewController(), title: "首页", imageName: "tabbar_home")
        addChildController(JYMessageViewController(), title: "消息", imageName: "tabbar_message_center")
        addChildController(JYDiscoverViewController(), title: "广场", imageName: "tabbar_discover")
        addChildController(JYProfileViewController(), title: "我", imageName: "tabbar_profile")
        
    }
    
    // 初始化子控制器
    private func addChildController(childController: UIViewController, title: String, imageName: String){
        // 1.
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        childController.title = title
        
        // 2.
        let nav = UINavigationController()
        nav.addChildViewController(childController)
        
        // 3.
        addChildViewController(nav)
        
    }

}

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
        // 再添加一个占位控制器
        addChildViewController(JYNilViewController())
        
        addChildController(JYDiscoverViewController(), title: "广场", imageName: "tabbar_discover")
        addChildController(JYProfileViewController(), title: "我", imageName: "tabbar_profile")
        
        // 3.添加加号发布按钮
        setupPublishBtn()
        
    }
    
    func publishClick(){
        print(#function)
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
    
    // 加号发布按钮
    private lazy var publishBtn:UIButton = {
        let btn = UIButton()
        
        // 设置前景图片
        btn.setImage(UIImage(named:"tabbar_compose_icon_add"), forState: UIControlState.Normal)
        btn.setImage(UIImage(named:"tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        
        // 设置背景图片
        btn.setBackgroundImage(UIImage(named:"tabbar_compose_button"), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named:"tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        
        // 监听发布按钮点击
        btn.addTarget(self, action: #selector(JYMainController.publishClick), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        return btn
    
    }()
    
    private func setupPublishBtn(){
        // 1.添加加号发布按钮
        tabBar.addSubview(publishBtn)
        
        // 2.设置按钮的位置
        let width = UIScreen.mainScreen().bounds.size.width / CGFloat(viewControllers!.count)
        let rect = CGRect(x: 0, y: 0, width: width, height: 49)
        
        publishBtn.frame = CGRectOffset(rect, width * 2, 0)
    
    
    }

}

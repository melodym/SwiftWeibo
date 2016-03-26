//
//  YJTabBarController.swift
//  SwiftWeibo
//
//  Created by hrscy on 16/3/25.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YJMainrController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewController(YJHomeTableViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(YJMessageTableViewController(), title: "消息", imageName: "tabbar_message_center")
        addChildViewController(YJDiscoverTableViewController(), title: "发现", imageName: "tabbar_discover")
        addChildViewController(YJProfileTableViewController(), title: "我", imageName: "tabbar_profile")
    }
    /**
    初始化子控制器
    - parameter childController: 需要初始化的控制器
    - parameter imageName:       图片名称
    */
    private func addChildViewController(childController: UIViewController, title:String, imageName:String) {
        //设置当前控制器对应tabbar的颜色
        //注意：在iOS7之前如果设置了tintColor只有文字会变，图片不会变
        tabBar.tintColor = UIColor.orangeColor()
        //设置tabbar对应的数据
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        //设置导航条和tabbar标题
        childController.title = title
        //给首页包装一个导航控制器
        let nav = UINavigationController()
        nav.addChildViewController(childController)
        
        //将导航控制器添加到当前控制器上
        addChildViewController(nav)
    }
}

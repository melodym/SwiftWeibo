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
        //设置当前控制器对应tabbar的颜色
        //注意：在iOS7之前如果设置了tintColor只有文字会变，图片不会变
        tabBar.tintColor = UIColor.orangeColor()
        //添加子控制器
        addChildViewControllers()
        //从iOS7之后就不推荐在viewDidLoad中设置frame
        
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //添加加号按钮
        setupComposeBtn()
    }
    /**
     * 监听按钮点击的方法
     * 不能是私有方法
     * 按钮点击使劲的调用是由 运行循环 监听并且以 消息机制 传递的，因此，按钮监听函数不能设置为private
     */
    func composeBtnClick() {
        print("----")
    }
    
    /**
     * 内部控制方法,添加加号按钮
     */
    private func setupComposeBtn() {
        //添加加号按钮
        tabBar.addSubview(composeBtn)
        //调整加号按钮的位置
        let width = UIScreen.mainScreen().bounds.size.width / CGFloat(viewControllers!.count)
        let rect = CGRectMake(0, 0, width, 49)
        composeBtn.frame = rect
        //第一个参数是frame大小，第二个参数x方向偏移的大小，第三个参数是y方向偏移的大小
        composeBtn.frame = CGRectOffset(rect, 2 * width, 0)
    }
    
    /**
     * 添加所有子控制器
     */
    private func addChildViewControllers() {
        //获取json文件路径
        let path = NSBundle.mainBundle().pathForResource("MainVCSettings.json", ofType: nil)
        //通过文件路径创建NSData
        if let jsonPath = path {
            let jsonData = NSData(contentsOfFile: jsonPath)
            do {
                //有可能发生异常的代码放到这里
                //序列化json数据 --> Array
                //try 发生异常会调到catch中
                //try！ 发生异常程序直接崩溃
                let dictArr = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.MutableContainers)
                //遍历数组,动态创建控制器和设置数据
                //在swift中，如果要遍历一个数组，必须明确数据的类型
                for dict in dictArr as! [[String: String]] {
                    //报错原因因为addChildViewController参数必须有值，但是字典的返回值是可选类型
                    addChildViewController(dict["vcName"]!, title: dict["title"]!, imageName: dict["imageName"]!)
                }
            } catch {
                //发生异常之后会执行代码
                //从本地加载
                addChildViewController("YJHomeTableViewController", title: "首页", imageName: "tabbar_home")
                addChildViewController("YJMessageTableViewController", title: "消息", imageName: "tabbar_message_center")
                addChildViewController("YJNullViewController", title: "", imageName: "tabbar_compose_center")
                addChildViewController("YJDiscoverTableViewController", title: "发现", imageName: "tabbar_discover")
                addChildViewController("YJProfileTableViewController", title: "我", imageName: "tabbar_profile")
            }
        }
    }
    
    /**
    初始化子控制器
    - parameter childController: 需要初始化的控制器
    - parameter imageName:       图片名称
    */
    private func addChildViewController(childControllerName: String, title:String, imageName:String) {
        //动态获取命名空间
        let ns = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        
        //将字符串转化为类
        //默认情况下命名空间就是项目的名称，但是命名空间可以修改
        let cls:AnyClass? = NSClassFromString(ns + "." + childControllerName)
        //通过类创建一个对象
        //将anyClass转换为指定的类型
        let vcClass = cls as! UIViewController.Type
        let vc = vcClass.init()

        //设置tabbar对应的数据
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        //设置导航条和tabbar标题
        vc.title = title
        //给首页包装一个导航控制器
        let nav = UINavigationController()
        nav.addChildViewController(vc)
        //将导航控制器添加到当前控制器上
        addChildViewController(nav)
    }
    // 懒加载
    private lazy var composeBtn: UIButton = {
        let btn = UIButton()
        //设置前景图片
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        //设置背景图片
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        btn.addTarget(self, action: "composeBtnClick", forControlEvents: UIControlEvents.TouchUpInside)
        return btn
    }()
    
}

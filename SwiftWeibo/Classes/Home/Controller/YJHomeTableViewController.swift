//
//  YJHomeTableViewController.swift
//  SwiftWeibo
//
//  Created by 北京龙链科技有限公司 on 16/3/25.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YJHomeTableViewController: YJBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        //如果没有登录,设置未登录的信息
        if !userLogin {
            visitorView?.setupVistorViewInfo(true, imageName: "visitordiscover_feed_image_house", message: "关注一些人，回这里看看有什么惊喜")
            return
        }
        //初始化导航条
        setupNav()
    }
    
    //MARK: -初始化导航条
    private func setupNav() {
//        //左边按钮
//        let leftBtn = UIButton()
//        leftBtn.setImage(UIImage(named: "navigationbar_friendattention"), forState: UIControlState.Normal)
//        leftBtn.setImage(UIImage(named: "navigationbar_friendattention_highlighted"), forState: UIControlState.Highlighted)
//        leftBtn.sizeToFit()
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)
//        //右边按钮
//        let rightBtn = UIButton()
//        rightBtn.setImage(UIImage(named: "navigationbar_pop"), forState: UIControlState.Normal)
//        rightBtn.setImage(UIImage(named: "navigationbar_pop_highlighted"), forState: UIControlState.Highlighted)
//        rightBtn.sizeToFit()
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        navigationItem.leftBarButtonItem = createBarButtonItem("navigationbar_friendattention")
        navigationItem.rightBarButtonItem = createBarButtonItem("navigationbar_pop")
    }

    private func createBarButtonItem(imageName: String) -> UIBarButtonItem {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), forState: UIControlState.Highlighted)
        btn.sizeToFit()
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btn)
        return UIBarButtonItem(customView: btn)
    }

}

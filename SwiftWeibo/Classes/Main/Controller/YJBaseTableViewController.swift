//
//  YJBaseTableViewController.swift
//  SwiftWeibo
//
//  Created by 杨蒙 on 16/3/27.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YJBaseTableViewController: UITableViewController, YJVistorViewDelegate {
    //定义一个变量，保存用户当前是否登录
    var userLogin = false
    //定义属性保存未登录界面
    var visitorView: YJVistorView?
    override func loadView() {
        userLogin ? super.loadView() : setupVistorView()
    }
    /**
     *   创建未登录界面
     */
    private func setupVistorView(){
        //初始化未登录界面
        let customView = YJVistorView()
        view = customView
        visitorView = customView
        //设置导航条未登录按钮
//        navigationController?.navigationBar.tintColor = UIColor.orangeColor()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.Plain, target: self, action: "registerBtnDidClick")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: UIBarButtonItemStyle.Plain, target: self, action: "loginBtnDidClick")
    }
    
    //MARK: -YJVistorViewDelegate
    func loginBtnDidClick() {
        
    }
    
    func registerBtnDidClick() {
        
    }
}

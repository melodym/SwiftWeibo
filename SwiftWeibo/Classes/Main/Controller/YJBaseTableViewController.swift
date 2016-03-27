//
//  YJBaseTableViewController.swift
//  SwiftWeibo
//
//  Created by 杨蒙 on 16/3/27.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YJBaseTableViewController: UITableViewController {
    //定义一个变量，保存用户当前是否登录
    var userLogin = false
    
    override func loadView() {
        userLogin ? super.loadView() : setupVistorView()
    }
    /**
     *   创建未登录界面
     */
    private func setupVistorView(){
        let customView = YJVistorView()
        view = customView
    }
}

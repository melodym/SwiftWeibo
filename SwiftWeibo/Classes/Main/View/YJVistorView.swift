//
//  YJVistorView.swift
//  SwiftWeibo
//
//  Created by 杨蒙 on 16/3/27.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YJVistorView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        //添加子控件
        addSubview(iconView)
        addSubview(maskBGView)
        addSubview(homeIcon)
        addSubview(messasgeLabel)
        addSubview(loginBtn)
        addSubview(registerBtn)
        //布局子控件
        //布局背景
        iconView.xmg_AlignInner(type: XMG_AlignType.Center, referView: self, size: nil)
        //布局房子
        homeIcon.xmg_AlignInner(type: XMG_AlignType.Center, referView: self, size: nil)
        //布局文本
        messasgeLabel.xmg_AlignVertical(type: XMG_AlignType.BottomCenter, referView: iconView, size: nil)
        //那个控件的 什么属性 等于 另外一个控件的 什么属性 乘以 多少 加上 多少
        let widthCons = NSLayoutConstraint.init(item: messasgeLabel, attribute: .Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 224)
        addConstraint(widthCons)
        //注册按钮
        registerBtn.xmg_AlignInner(type: XMG_AlignType.BottomLeft, referView: messasgeLabel, size: CGSize(width: 100, height: 30), offset: CGPoint(x: 0, y: 30))
        //登录按钮
        loginBtn.xmg_AlignInner(type: XMG_AlignType.BottomRight, referView: messasgeLabel, size: CGSize(width: 100, height: 30), offset: CGPoint(x: 0, y: 30))
        // 设置蒙版
        maskBGView.xmg_Fill(self)
        
    }
    //swift推荐我们自定义1个控件，要么用代码，要么就用xib、storyboard
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //懒加载
    //转盘
    private lazy var iconView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
        
        return iv
    }()
    //房子
    private lazy var homeIcon: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
        
        return iv
    }()
    //文本
    private lazy var messasgeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.lightGrayColor()
        label.text = "水电费撒分开了萨芬看撒好地方奥卡福哈塞德里克就反悔"
        return label
    }()
    //登录按钮
    private lazy var loginBtn: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        button.setTitle("登录", forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        return button
    }()
    //注册按钮
    private lazy var registerBtn: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        button.setTitle("注册", forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        return button
    }()
    private lazy var maskBGView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
        return iv
    }()
    
}

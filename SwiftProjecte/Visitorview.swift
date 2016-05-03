//
//  Visitorview.swift
//  SwiftProjecte
//
//  Created by 萝卜 on 16/5/1.
//  Copyright © 2016年 萝卜. All rights reserved.
//

import UIKit
//定义登录，注册按钮的点击协议
protocol VisitorviewDelegate:NSObjectProtocol{
    //登录回调
    func loginbtnWillClick()
    //注册回调
    func reginstbtnWillClick()
}

class Visitorview: UIView {
//    定义一个变量保存按钮的代理对象，必须加上weak，避免循环引用
    
    weak  var delegate:VisitorviewDelegate?
    
    func setupVisitorInfo(isHome:Bool,imageName:String,message:String){
        //如果不是首页隐藏转盘图片
        inconView.hidden = !isHome
        //修改中间的图片
        homeIcon.image = UIImage(named: imageName)
        //修改显示文本
        messageLabel.text = message
        
        //判断如果是首页就执行转盘动画
        if isHome
        {
            starAnimation()
        }
    
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        //添加子控件
        
        addSubview(inconView)
        addSubview(maskBgview)
        addSubview(homeIcon)
        addSubview(messageLabel)
        addSubview(loginbtn)
        addSubview(reginstbtn)
        //布局子控件
        inconView.xmg_AlignInner(type: XMG_AlignType.Center, referView: self, size: nil)
        homeIcon.xmg_AlignInner(type: XMG_AlignType.Center, referView: self, size: nil)
        
        //        那个 控件的 什么 属性 等于 另外一个控件的 什么属性 乘以 多少 在加上多少 outlaout
        //        消息文字
        messageLabel.xmg_AlignVertical(type: XMG_AlignType.BottomCenter, referView: inconView, size: nil)
        
        addConstraint(NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 224))
        // 注册按钮
        reginstbtn.xmg_AlignVertical(type: XMG_AlignType.BottomLeft, referView: messageLabel, size: CGSize(width: 100, height: 35), offset: CGPoint(x: 0, y: 20))
        // 登录按钮
        loginbtn.xmg_AlignVertical(type: XMG_AlignType.BottomRight, referView: messageLabel, size: CGSize(width: 100, height: 35), offset: CGPoint(x: 0, y: 20))
        // 背景蒙版
        maskBgview.xmg_Fill(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //懒加载控件
    private lazy var inconView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
        return iv
    }()
    private lazy var homeIcon: UIImageView = {
        let iv = UIImageView(image: (UIImage(named: "visitordiscover_feed_image_house")))
        return iv
    }()
    private lazy var messageLabel: UILabel = {
        let lable = UILabel()
        lable.text = "卡萨发哈哈哈刚好看过后；韩国；哈哈；蛤蛤蛤；阿合格"
        lable.numberOfLines = 0
        lable.textColor = UIColor.darkGrayColor()
        return lable
    }()
    private lazy var loginbtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("登录", forState:.Normal)
        btn.setBackgroundImage(UIImage(named:"common_button_white_disable"), forState: .Normal)
        btn.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        btn.addTarget(self, action: "loginbtnClick", forControlEvents: UIControlEvents.TouchUpInside)

        return btn
        
    }()
    private lazy var reginstbtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("注册", forState:.Normal)
        btn.setBackgroundImage(UIImage(named:"common_button_white_disable"), forState: .Normal)
        btn.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        btn.addTarget(self, action: "reginstbtnClick", forControlEvents: UIControlEvents.TouchUpInside)
        return btn
    }()
    private lazy var maskBgview:UIImageView = {

        let iv = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
        return iv
    }()
    
//    内部方法，定义首页转盘动画
    private func starAnimation(){
        //创建动画
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        //设置动画属性
        animation.toValue = 2 * M_PI
        animation.duration = 20
        animation.repeatCount = MAXFLOAT
        animation.removedOnCompletion = false
        //将动画添加到图层上
        inconView.layer.addAnimation(animation, forKey: nil)
    
    
    }
//    定义登录，注册按钮点击后的操作
    func loginbtnClick(){
        //调用代理
        delegate?.loginbtnWillClick()
    
    }
    func reginstbtnClick(){
        delegate?.reginstbtnWillClick()
        
    }
}

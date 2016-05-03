//
//  Popover.swift
//  SwiftProjecte
//
//  Created by 萝卜 on 16/5/3.
//  Copyright © 2016年 萝卜. All rights reserved.
//

import UIKit

class Popover: UIPresentationController {
//    初始化方法
//    presentedViewController  被展现的控制器
//    presentingViewController 发起的控制器
//    ios8推出的新方法
    
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
    }
//    定义下拉表的frame，即将布局转场子视图的时候调用
    override func containerViewWillLayoutSubviews() {
//        presentedView被展现的视图
        presentedView()?.frame = CGRect(x: 100, y: 56, width: 200, height: 200)
//        将蒙版添加到展现视图的下面
        containerView?.insertSubview(coverView, atIndex: 0)
    }
    
//    懒加载 一个蒙版
    private lazy var coverView:UIView = {
//        创建蒙版
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.3)
        view.frame = UIScreen.mainScreen().bounds
//        添加手势监听
        let tap = UITapGestureRecognizer(target: self, action: "close")
//        监听添加到视图
        view.addGestureRecognizer(tap)
        return view
    }()
    
    func close(){
    
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }

}

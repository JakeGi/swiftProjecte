//
//  MainViewController.swift
//  SwiftProjecte
//
//  Created by 萝卜 on 16/5/1.
//  Copyright © 2016年 萝卜. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //设置tabbaritem
        addChildViewController(HomeTableViewController(), title: "首页", imageName: "tabbar_home",hightlighted: "tabbar_home_highlighted")
        addChildViewController(MessageTableViewController(),title: "消息",imageName: "tabbar_message_center",hightlighted: "tabbar_message_center_highlighted")
        addChildViewController(NullViewController(),title: "",imageName: "",hightlighted: "")
        addChildViewController(FoundTableViewController(), title: "广场", imageName: "tabbar_discover", hightlighted: "tabbar_discover_highlighted")
        addChildViewController(MeTableViewController(), title: "我", imageName: "tabbar_profile", hightlighted: "tabbar_profile_highlighted")
        
    }
    //mark: 懒加载中间的按钮
    //创建按钮
    private lazy var composeBTN : UIButton = {
        let btn = UIButton(type: UIButtonType.Custom)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        btn.addTarget(self, action: "composeClick", forControlEvents:  UIControlEvents.TouchUpInside)
        self.tabBar.addSubview(btn)
        return btn
    }()
    //计算按钮的位置
    private func setupComposeBtn(){
        let count = childViewControllers.count
        //计算每个tabbaritem的宽度
        let with = tabBar.bounds.width / CGFloat(count)
        //偏移2个单位
        let rect = CGRect(x: 0, y: 0, width: with, height: tabBar.bounds.height)
        composeBTN.frame = CGRectOffset(rect, with*2, 0)
        
    }
//    中间的按钮点击事件
    func  composeClick(){
    
        print("点击了按钮")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //    添加按钮
        setupComposeBtn()
    }
    
    //    封装tabbar
    private func addChildViewController(childController: UIViewController,title:String,imageName:String,hightlighted:String) {
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: hightlighted)
        childController.title = title
        
        
        //给tabbar包装一个导航控制器
        let nav = UINavigationController(rootViewController: childController)
        //将导航控制器添加到当前控制器上
        addChildViewController(nav)
    }
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

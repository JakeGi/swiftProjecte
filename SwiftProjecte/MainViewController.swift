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
        
        //设置tabbar字体颜色
        tabBar.tintColor = UIColor.orangeColor()
        
        //设置tabbaritem
        addChildViewController(HomeTableViewController(), title: "首页", imageName: "tabbar_home",hightlighted: "tabbar_home_highlighted")
        addChildViewController(MessageTableViewController(),title: "消息",imageName: "tabbar_message_center",hightlighted: "tabbar_message_center_highlighted")
        addChildViewController(FoundTableViewController(), title: "广场", imageName: "tabbar_discover", hightlighted: "tabbar_discover_highlighted")
        addChildViewController(MeTableViewController(), title: "我", imageName: "tabbar_profile", hightlighted: "tabbar_profile_highlighted")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

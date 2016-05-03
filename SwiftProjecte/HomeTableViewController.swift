//
//  HomeTableViewController.swift
//  SwiftProjecte
//
//  Created by 萝卜 on 16/5/1.
//  Copyright © 2016年 萝卜. All rights reserved.
//

import UIKit

class HomeTableViewController: BaseTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        如果没有登录，设置未登录界面
        if !userLogin{
            viditorView?.setupVisitorInfo(true, imageName: "visitordiscover_feed_image_house", message: "关注一些人，回这里看看有什么惊喜")
            return //如果没有登录就不执行后面的代码，直接return
            
        }
        setupNav()
        
        //        注册通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "change", name: PopoverAnimationWillShow, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "change", name: PopoverAnimationWillDismis, object: nil)
        
    }
//    移除通知
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
//    修改标题栏状态
    func change(){
    let titleBtn = navigationItem.titleView as! TitleUIButtonFram
        titleBtn.selected = !titleBtn.selected
    
    }
    
    private func setupNav(){
        
        //    初始化左右按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem.creatButtonItem("navigationbar_friendattention", target: self, action: "leftItemClick")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.creatButtonItem("navigationbar_pop", target: self, action: "rightItemClick")
        //        初始化标题按钮
        let titleBar = TitleUIButtonFram()
        titleBar.setTitle("萝卜 ", forState: UIControlState.Normal)
        titleBar.addTarget(self, action: "titleBarClick:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        navigationItem.titleView = titleBar
    }
    func titleBarClick(btn:TitleUIButtonFram){
        
        //点击title弹出下拉框
//        btn.selected = !btn.selected
        //初始化下拉框
        let sb = UIStoryboard(name: "PopoverStoryboard", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        //设置转场代理
        vc?.transitioningDelegate = PopoverAnimater
        //设置自定义转场
        vc?.modalPresentationStyle = UIModalPresentationStyle.Custom
        presentViewController(vc!, animated: true, completion: nil)
    }
    func leftItemClick(){
        
        print("leftItemClick")
    }
    
    func rightItemClick(){
        
        print("rightItemClick")
        
        let sb = UIStoryboard(name: "QrcodeViewController", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        presentViewController(vc!, animated: true, completion: nil)
    }
    
    private lazy var PopoverAnimater:PopoverAnimate = {
        let pa = PopoverAnimate()
        return pa
        
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
}
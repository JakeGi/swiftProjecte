//
//  UIBarButtonItemCouetem.swift
//  SwiftProjecte
//
//  Created by 萝卜 on 16/5/2.
//  Copyright © 2016年 萝卜. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    class func creatButtonItem(imageName:String,target: AnyObject?, action: Selector) -> UIBarButtonItem{
        let btn = UIButton()
        btn.setImage(UIImage(named:imageName), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), forState: UIControlState.Highlighted)
        btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        btn.sizeToFit()
        return UIBarButtonItem(customView: btn)
    }
}

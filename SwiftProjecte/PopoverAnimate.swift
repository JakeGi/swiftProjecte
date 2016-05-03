//
//  PopoverAnimate.swift
//  SwiftProjecte
//
//  Created by 萝卜 on 16/5/3.
//  Copyright © 2016年 萝卜. All rights reserved.
//

import UIKit

let PopoverAnimationWillShow = "PopoverAnimationWillShow"
let PopoverAnimationWillDismis = "PopoverAnimationWillDismis"

class PopoverAnimate: NSObject ,UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning{
    //    定义变量，保存视图展开收起状态
    var ispresent:Bool = false

    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return Popover(presentedViewController: presented, presentingViewController: presenting)
    }
    //   Mark: 自定义视图出场和退场
    //    谁来负责出场
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        ispresent = true
//        发送通知控制器，即将展开
        NSNotificationCenter.defaultCenter().postNotificationName(PopoverAnimationWillShow, object: self)
        return self
    }
    //    谁来负责退场
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        ispresent = false
//        发送通知控制器，即将消失
            NSNotificationCenter.defaultCenter().postNotificationName(PopoverAnimationWillDismis, object: self)
        return self
    }
    //    动画时长
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval{
        return 0.5
        
    }
    //    上下文，定义展开收起动画
    func animateTransition(transitionContext: UIViewControllerContextTransitioning){
        if ispresent {
            print("展开")
            //        获取执行动画的view
            let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
            //        压缩视图，定义展开动画
            toView?.transform = CGAffineTransformMakeScale(1.0, 0.0)
            //        将获取到视图添加到容器上
            transitionContext.containerView()?.addSubview(toView!)
            //        定义动画中心、锚点
            toView?.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            //        执行动画
            UIView.animateWithDuration(transitionDuration(transitionContext)) {
                toView?.transform = CGAffineTransformIdentity
                transitionContext.completeTransition(true)
            }
            
        }else{
            print("收起")
            //        获取执行动画的view
            let formView = transitionContext.viewForKey(UITransitionContextFromViewKey)
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
                formView?.transform = CGAffineTransformMakeScale(1.0, 0.000000000000001)
                //如果不写，会导致一些位置错误
                transitionContext.completeTransition(true)
            })
        }
        
    }
}

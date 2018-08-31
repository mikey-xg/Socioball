//
//  ViewController.swift
//  20171027
//
//  Created by 苏文潇 on 2017/10/27.
//  Copyright © 2017年 Koalareading. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var iconView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.orange
        view.layer.cornerRadius = 40
        view.layer.masksToBounds = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(iconView)
        
        iconView.frame = CGRect(x: 50, y: 30, width: 80, height: 80)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var isNick: Bool = false
    //    MARK: 手势点击
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let tou = ((touches as NSSet).anyObject() as AnyObject)
        let po = tou.location(in: self.view)
        if  iconView.frame.contains(po) == true{
            isNick = true
        }else{
            isNick = false
        }
        
    }
    
    //    MARK: 手势移动
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let tou = ((touches as NSSet).anyObject() as AnyObject)
        
        let po = tou.location(in: self.view)
        
        if  iconView.frame.contains(po) == true{
            if isNick == true{
                UIView.animate(withDuration: 0.1, animations: {
                    self.iconView.center = po
                    self.view.layoutIfNeeded()
                })
            }
        }
        
    }
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    //    MARK: 手抬起
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let tou = ((touches as NSSet).anyObject() as AnyObject)
        
        let po = tou.location(in: self.view)
        
        if  iconView.frame.contains(po) == true{
            if po.x < UIScreen.main.bounds.size.width/2{
                if po.y < self.iconView.bounds.size.width/2 + 10{
                    UIView.animate(withDuration: 0.25, animations: {
                        self.iconView.center = CGPoint(x: self.iconView.bounds.size.width/2 + 10, y: self.iconView.bounds.size.width/2 + 30)
                        self.view.layoutIfNeeded()
                    })
                }else if po.y > screenHeight - self.iconView.bounds.size.width/2 - 10{
                    UIView.animate(withDuration: 0.25, animations: {
                        self.iconView.center = CGPoint(x: self.iconView.bounds.size.width/2 + 10, y: self.screenHeight - self.iconView.bounds.size.width/2 - 10)
                        self.view.layoutIfNeeded()
                    })
                }else{
                    UIView.animate(withDuration: 0.25, animations: {
                        self.iconView.center = CGPoint(x: self.iconView.bounds.size.width/2 + 10, y: po.y)
                        self.view.layoutIfNeeded()
                    })
                }
                
            }else if po.x >= UIScreen.main.bounds.size.width/2{
                
                if po.y < self.iconView.bounds.size.width/2 + 10{
                    UIView.animate(withDuration: 0.25, animations: {
                        self.iconView.center = CGPoint(x: self.screenWidth - self.iconView.bounds.size.width/2 - 10, y: self.iconView.bounds.size.width/2 + 30)
                        self.view.layoutIfNeeded()
                    })
                }else if po.y > screenHeight - self.iconView.bounds.size.width/2 - 10{
                    UIView.animate(withDuration: 0.25, animations: {
                        self.iconView.center = CGPoint(x: self.screenWidth - self.iconView.bounds.size.width/2 - 10, y: self.screenHeight - self.iconView.bounds.size.width/2 - 10)
                        self.view.layoutIfNeeded()
                    })
                }else{
                    UIView.animate(withDuration: 0.25, animations: {
                        self.iconView.center = CGPoint(x:self.screenWidth - self.iconView.bounds.size.width/2 - 10, y: po.y)
                        self.view.layoutIfNeeded()
                    })
                }
    
            }
        }
        
//        MARK:  纠正位置
        if  self.iconView.center.x != screenWidth - 60.0 && self.iconView.center.x != 60.0{

            if self.iconView.center.x >= UIScreen.main.bounds.size.width/2{
                UIView.animate(withDuration: 0.25, animations: {
                    self.iconView.center = CGPoint(x: self.screenWidth - self.iconView.bounds.size.width/2 - 10, y: self.iconView.center.y)
                    self.view.layoutIfNeeded()
                })
            }else{
                UIView.animate(withDuration: 0.25, animations: {
                    self.iconView.center = CGPoint(x: self.iconView.bounds.size.width/2 + 10, y: self.iconView.center.y)
                    self.view.layoutIfNeeded()
                })
            }
        }
        
    }
    
}
/*
    分析： 1、判断小球的中心是否大于等于屏幕尺寸的中心，如果大于就偏向右侧，反之左侧
 
          2、判断边界，不准超出边界
                1、判断小球中心的位置距离屏幕顶、底部不得小于半径
                2、判断小球中心的位置距离屏幕左、右不得小于半径
                3、当在右侧时，使用动画的形式靠近右侧，左侧同理
 
          3、最后需要纠正位置(因为出现一个不明确的bug)
                快速滑动后会出现一个问题，然后通过纠正位置得到可能是完美的解决
 */





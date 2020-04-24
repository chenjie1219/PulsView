//
//  PulseView.swift
//  PulseView
//
//  Created by Jason on 2020/4/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class PulseView: UIView {
    
    lazy var path = UIBezierPath(ovalOf: CGSize(width: width, height: width), centered: true).cgPath
    
    /// 动画图层
    lazy var pulseLayer:CAShapeLayer = {
        
        let layer = CAShapeLayer()
        
        layer.backgroundColor = UIColor.clear.cgColor
        
        layer.path = path
        
        layer.position = CGPoint(x: width/2, y: width/2)
        
        layer.fillColor = UIColor.clear.cgColor
        /// 脉冲颜色
        layer.strokeColor = UIColor.red.cgColor
        
        return layer
        
    }()
    
    lazy var replicatorLayer:CAReplicatorLayer = {
        
        let layer = CAReplicatorLayer()
        layer.bounds = CGRect(x: 0, y: 0, width: width, height: width)
        layer.position = CGPoint(x: width/2, y: width/2)
        layer.instanceCount = 3  // 三个复制图层
        layer.instanceDelay = 1  // 频率
        layer.addSublayer(pulseLayer)
        return layer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
}


// MARK - UI
extension PulseView {
    
    func setupUI() {
        
        backgroundColor = .clear
        
        layer.addSublayer(replicatorLayer)
        
    }
    
}


// MARK: - Method
extension PulseView {
    
    func starAnimation() {
        /// 透明
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 0.85  // 起始值
        opacityAnimation.toValue = 0.3     // 结束值
        
        /// 扩散动画
        let scaleAnimation = CABasicAnimation(keyPath: "transform")
        let t = CATransform3DIdentity
        scaleAnimation.fromValue = CATransform3DScale(t, 1.0, 1.0, 0.0)
        scaleAnimation.toValue =  CATransform3DScale(t, 5.0, 5.0, 0.0)
        
        /// 给CAShapeLayer添加组合动画
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [opacityAnimation,scaleAnimation]
        groupAnimation.duration = 1.5   //持续时间
        groupAnimation.repeatCount = HUGE
        pulseLayer.add(groupAnimation, forKey: nil)
    }
    
}

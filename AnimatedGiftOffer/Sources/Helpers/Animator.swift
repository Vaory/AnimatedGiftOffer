//
//  Animator.swift
//  AnimatedGiftOffer
//
//  Created by Mikhail Demichev on 31.10.2024.
//

import UIKit

class Animator {
    private weak var view: UIView?
    
    private var rotationAngle = 20.0
    private let animationDuration = 0.1
    private let repeatCount: Float = 3.0

    init(view: UIView) {
        self.view = view
    }
    
    func startShakeAnimation() {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.fromValue = -CGFloat.pi / rotationAngle
        rotationAnimation.toValue = CGFloat.pi / rotationAngle
        rotationAnimation.duration = animationDuration
        rotationAnimation.repeatCount = repeatCount
        rotationAnimation.autoreverses = true
        view?.layer.add(rotationAnimation, forKey: "shakeRotation")
    }
}

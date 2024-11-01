//
//  Animator.swift
//  AnimatedGiftOffer
//
//  Created by Mikhail Demichev on 31.10.2024.
//

import UIKit

class Animator {
    private weak var view: UIView?

    init(view: UIView) {
        self.view = view
    }
    
    func startShakeAnimation() {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.fromValue = -CGFloat.pi / 20
        rotationAnimation.toValue = CGFloat.pi / 20
        rotationAnimation.duration = 0.1
        rotationAnimation.repeatCount = 3
        rotationAnimation.autoreverses = true
        view?.layer.add(rotationAnimation, forKey: "shakeRotation")
    }
}

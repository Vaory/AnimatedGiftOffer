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
    
    // Анимация "потряхивания" картинки, по заданным параметрам по оси z и использованием autoreverses для плавного возвращения назад
    func startShakeAnimation() {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.fromValue = -CGFloat.pi / Constants.rotationAngle
        rotationAnimation.toValue = CGFloat.pi / Constants.rotationAngle
        rotationAnimation.duration = Constants.animationDuration
        rotationAnimation.repeatCount = Constants.repeatCount
        rotationAnimation.autoreverses = true
        view?.layer.add(rotationAnimation, forKey: "shakeRotation")
    }
}

private extension Animator {
    struct Constants {
        static let rotationAngle = 20.0
        static let animationDuration = 0.1
        static let repeatCount: Float = 3.0
    }
}


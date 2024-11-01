//
//  ViewController.swift
//  AnimatedGiftOffer
//
//  Created by Mikhail Demichev on 31.10.2024.
//

import UIKit

class ViewController: UIViewController, TimerServiceDelegate {
    private let countdownView = GiftOfferView()
    private let timerService = TimerService(initialMilliseconds: 30000)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countdownView.frame = CGRect(x: 0, y: 0, width: 168, height: 168)
        countdownView.center = view.center
        view.addSubview(countdownView)
        
        countdownView.configureView()
        
        timerService.delegate = self
        timerService.startTimer()
        startShakeAnimation()
    }
    
    func timerDidUpdate(remainingTime: String) {
        // Добавляем атрибуты к строке
        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            .strokeColor: UIColor.black,
            .foregroundColor: UIColor.white,
            .strokeWidth: -1.0,
            .font: UIFont.monospacedDigitSystemFont(ofSize: 22, weight: .semibold)
        ]
        
        let attributedText = NSAttributedString(string: remainingTime, attributes: strokeTextAttributes)
        countdownView.updateCountdownLabel(with: attributedText)
    }
    
    func timerDidEnd() {
        countdownView.layer.removeAnimation(forKey: "shakeRotation")
    }
    
    private func startShakeAnimation() {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.fromValue = -CGFloat.pi / 20
        rotationAnimation.toValue = CGFloat.pi / 20
        rotationAnimation.duration = 0.1
        rotationAnimation.repeatCount = .infinity
        rotationAnimation.autoreverses = true
        countdownView.giftImageView.layer.add(rotationAnimation, forKey: "shakeRotation")
    }
}

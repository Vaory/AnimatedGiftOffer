//
//  ViewController.swift
//  AnimatedGiftOffer
//
//  Created by Mikhail Demichev on 31.10.2024.
//

import UIKit

class ViewController: UIViewController, TimerServiceDelegate {
    private let countdownView = GiftOfferView()
    private let timerService = TimerService(initialMilliseconds: 30_000)
    private var shakeAnimationTimer: Timer?
    private var animator: Animator?
    
    private let fontSize = 22.0
    private let viewSize = 168

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countdownView.frame = CGRect(x: 0, y: 0, width: viewSize, height: viewSize)
        countdownView.center = view.center
        view.addSubview(countdownView)
        
        countdownView.configureView()
        
        timerService.delegate = self
        timerService.startTimer()
        
        animator = Animator(view: countdownView.giftImageView)
        
        shakeAnimationTimer = Timer.scheduledTimer(
            timeInterval: 1.5,
            target: self,
            selector: #selector(triggerShakeAnimation),
            userInfo: nil,
            repeats: true
        )
    }
    
    func timerDidUpdate(remainingTime: String) {
        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            .strokeColor: UIColor.black,
            .foregroundColor: UIColor.white,
            .strokeWidth: -1.0,
            .font: UIFont.monospacedDigitSystemFont(ofSize: fontSize, weight: .semibold)
        ]
        
        let attributedText = NSAttributedString(string: remainingTime, attributes: strokeTextAttributes)
        countdownView.updateCountdownLabel(with: attributedText)
    }
    
    func timerDidEnd() {
        shakeAnimationTimer?.invalidate()
        shakeAnimationTimer = nil
        countdownView.layer.removeAnimation(forKey: "shakeRotation")
    }
    
    @objc private func triggerShakeAnimation() {
        animator?.startShakeAnimation() 
    }
}

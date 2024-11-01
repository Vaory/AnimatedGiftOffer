//
//  ViewController.swift
//  AnimatedGiftOffer
//
//  Created by Mikhail Demichev on 31.10.2024.
//

import UIKit

class ViewController: UIViewController, TimerServiceDelegate {
    private let giftOfferView = GiftOfferView()
    private let timerService = TimerService(initialMilliseconds: 30_000)
    private var animationTimer: Timer?
    private var animator: Animator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Здесь можно было бы использовать адаптивную верстку AutoLayout, но сложно попасть в точно заданные размеры макета c Figma. Это единственное место где не использовал адаптивную верстку в проекте, тобы соблюсти ТЗ
        giftOfferView.frame = CGRect(x: 0, y: 0, width: Constants.viewSize, height: Constants.viewSize)
        giftOfferView.center = view.center
        view.addSubview(giftOfferView)
        
        giftOfferView.configureView()
        
        timerService.delegate = self
        timerService.startTimer()
        
        animator = Animator(view: giftOfferView.giftImageView)
        
        animationTimer = Timer.scheduledTimer(
            timeInterval: Constants.shakeAnimationInterval,
            target: self,
            selector: #selector(triggerShakeAnimation),
            userInfo: nil,
            repeats: true
        )
    }
    
    // Метод которым добился корректного отображения текста, а использование шрифта monospacedDigitSystemFont позволило избежать подергивания таймера из за разного размера цифр
    func timerDidUpdate(remainingTime: String) {
        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            .strokeColor: UIColor.black,
            .foregroundColor: UIColor.white,
            .strokeWidth: Constants.strokeWidth,
            .font: UIFont.monospacedDigitSystemFont(ofSize: Constants.fontSize, weight: .semibold)
        ]
        
        let attributedText = NSAttributedString(string: remainingTime, attributes: strokeTextAttributes)
        giftOfferView.updateCountdownLabel(with: attributedText)
    }
    
    func timerDidEnd() {
        animationTimer?.invalidate()
        animationTimer = nil
        giftOfferView.layer.removeAnimation(forKey: "shakeRotation")
    }
    
    @objc private func triggerShakeAnimation() {
        animator?.startShakeAnimation()
    }
}

private extension ViewController {
    struct Constants {
        static let fontSize = 22.0
        static let viewSize = 168.0
        static let shakeAnimationInterval = 1.5
        static let strokeWidth = -1.0
    }
}

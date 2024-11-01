//
//  GiftOfferView.swift
//  AnimatedGiftOffer
//
//  Created by Mikhail Demichev on 31.10.2024.
//

import UIKit

class GiftOfferView: UIView, TimerModelDelegate {
    private let timerLabel = UILabel()
    private let giftImageView = UIImageView(image: UIImage(named: "GiftImage"))
    
    private let timerModel = TimerModel()
    private var shakeAnimator: Animator?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        backgroundColor = .darkGray
        layer.cornerRadius = 84
        clipsToBounds = true
        
        setupGiftImageView()
        setupCountdownLabel()

        timerModel.delegate = self
        timerModel.startTimer()
        
        shakeAnimator = Animator(view: giftImageView)
        startShakeAnimation()
    }
    
    private func setupGiftImageView() {
        giftImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(giftImageView)
        
        NSLayoutConstraint.activate([
            giftImageView.topAnchor.constraint(equalTo: topAnchor, constant: 11),
            giftImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            giftImageView.widthAnchor.constraint(equalToConstant: 68),
            giftImageView.heightAnchor.constraint(equalToConstant: 85)
        ])
    }
    
    private func setupCountdownLabel() {
        timerLabel.textAlignment = .center
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(timerLabel)
        
        NSLayoutConstraint.activate([
            timerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            timerLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -29)
        ])
    }
    
    func timerDidUpdate(remainingTime: String) {
        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            .strokeColor: UIColor.black,
            .foregroundColor: UIColor.white,
            .strokeWidth: -1.0,
            .font: UIFont.monospacedDigitSystemFont(ofSize: 22, weight: .semibold)
        ]
        
        timerLabel.attributedText = NSAttributedString(string: remainingTime, attributes: strokeTextAttributes)
    }

    func timerDidEnd() {
        shakeAnimator = nil
    }

    private func startShakeAnimation() {
        Timer.scheduledTimer(withTimeInterval: 1.3, repeats: true) { [weak self] _ in
            self?.shakeAnimator?.startShakeAnimation()
        }
    }
}

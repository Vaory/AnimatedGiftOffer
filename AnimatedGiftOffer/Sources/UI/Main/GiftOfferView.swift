//
//  GiftOfferView.swift
//  AnimatedGiftOffer
//
//  Created by Mikhail Demichev on 31.10.2024.
//

import UIKit

class GiftOfferView: UIView {
    private let countdownLabel = UILabel()
    let giftImageView = UIImageView(image: UIImage(named: "GiftImage"))
    
    func configureView() {
        backgroundColor = .darkGray
        layer.cornerRadius = 84
        clipsToBounds = true
        
        setupGiftImageView()
        setupCountdownLabel()
    }
    
    func updateCountdownLabel(with attributedText: NSAttributedString) {
        countdownLabel.attributedText = attributedText
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
        countdownLabel.textAlignment = .center
        countdownLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(countdownLabel)
        
        NSLayoutConstraint.activate([
            countdownLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            countdownLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -29)
        ])
    }
}

//
//  GiftOfferView.swift
//  AnimatedGiftOffer
//
//  Created by Mikhail Demichev on 31.10.2024.
//

import UIKit

class GiftOfferView: UIView {
    let giftImageView = UIImageView(image: UIImage(named: "GiftImage"))
    private let countdownLabel = UILabel()

    // Данные отступов и размеров взяты с макетов Figma
    private let topAnchorConstraint = 11.0
    private let bottomAnchorConstraint = -29.0
    private let giftImageWidth = 68.0
    private let giftImageHeight = 85.0
    
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
            giftImageView.topAnchor.constraint(equalTo: topAnchor, constant:  topAnchorConstraint),
            giftImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            giftImageView.widthAnchor.constraint(equalToConstant: giftImageWidth),
            giftImageView.heightAnchor.constraint(equalToConstant: giftImageHeight)
        ])
    }
    
    private func setupCountdownLabel() {
        countdownLabel.textAlignment = .center
        countdownLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(countdownLabel)
        
        NSLayoutConstraint.activate([
            countdownLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            countdownLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottomAnchorConstraint)
        ])
    }
}

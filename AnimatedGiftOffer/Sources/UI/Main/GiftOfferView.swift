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

    func configureView() {
        backgroundColor = .darkGray
        layer.cornerRadius = Constants.viewCornerRadius
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
            giftImageView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.topAnchorConstraint),
            giftImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            giftImageView.widthAnchor.constraint(equalToConstant: Constants.giftImageWidth),
            giftImageView.heightAnchor.constraint(equalToConstant: Constants.giftImageHeight)
        ])
    }
    
    private func setupCountdownLabel() {
        countdownLabel.textAlignment = .center
        countdownLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(countdownLabel)
        
        NSLayoutConstraint.activate([
            countdownLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            countdownLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.bottomAnchorConstraint)
        ])
    }
}

// Данные по размерам и отступам взяты с макета Figma
private extension GiftOfferView {
    struct Constants {
        static let topAnchorConstraint = 11.0
        static let bottomAnchorConstraint = -29.0
        static let viewCornerRadius = 84.0
        static let giftImageWidth = 68.0
        static let giftImageHeight = 85.0
    }
}

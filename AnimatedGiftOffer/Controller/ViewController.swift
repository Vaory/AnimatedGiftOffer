//
//  ViewController.swift
//  AnimatedGiftOffer
//
//  Created by Mikhail Demichev on 31.10.2024.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let countdownView = GiftOfferView(frame: CGRect(x: 0, y: 0, width: 168, height: 168))
        countdownView.center = view.center
        view.addSubview(countdownView)
    }
}


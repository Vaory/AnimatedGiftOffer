//
//  TimerService.swift
//  AnimatedGiftOffer
//
//  Created by Mikhail Demichev on 31.10.2024.
//

import Foundation

protocol TimerServiceDelegate: AnyObject {
    func timerDidUpdate(remainingTime: String)
    func timerDidEnd()
}

class TimerService {
    weak var delegate: TimerServiceDelegate?
    
    private var timer: DispatchSourceTimer?
    var initialMilliseconds: Int
    var remainingMilliseconds: Int
    
    init(initialMilliseconds: Int = 30_000) {
        self.initialMilliseconds = initialMilliseconds
        self.remainingMilliseconds = initialMilliseconds
    }
    
    func startTimer() {
        timer?.cancel()
        timer = DispatchSource.makeTimerSource(queue: .main)
        timer?.schedule(deadline: .now(), repeating: 0.01)
        timer?.setEventHandler { [weak self] in
            self?.updateTimer()
        }
        timer?.resume()
    }
    
    private func updateTimer() {
        guard remainingMilliseconds > 0 else {
            timer?.cancel()
            timer = nil
            delegate?.timerDidEnd()
            return
        }
        
        remainingMilliseconds -= 10
        let timeString = formattedTime(remainingMilliseconds)
        delegate?.timerDidUpdate(remainingTime: timeString)
    }
    
    private func formattedTime(_ milliseconds: Int) -> String {
        let minutes = (milliseconds / 1_000) / 60
        let seconds = (milliseconds / 1_000) % 60
        let miliseconds = (milliseconds % 1_000) / 10
        return String(format: "%02d:%02d:%02d", minutes, seconds, miliseconds)
    }
    
    func reset() {
        remainingMilliseconds = initialMilliseconds
    }
}

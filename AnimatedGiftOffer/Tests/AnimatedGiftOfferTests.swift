//
//  AnimatedGiftOfferTests.swift
//  AnimatedGiftOfferTests
//
//  Created by Mikhail Demichev on 01.11.2024.
//

import XCTest
@testable import AnimatedGiftOffer

class AnimatedGiftOfferTests: XCTestCase, TimerServiceDelegate {
    
    var timerModel: TimerService!
    var timerDidUpdateCalled = false
    var timerDidEndCalled = false
    var updatedRemainingTime: String?
    
    override func setUp() {
        super.setUp()
        timerModel = TimerService(initialMilliseconds: 100)
        timerModel.delegate = self
    }
    
    override func tearDown() {
        timerModel = nil
        timerDidUpdateCalled = false
        timerDidEndCalled = false
        updatedRemainingTime = nil
        super.tearDown()
    }
    
    
    func timerDidUpdate(remainingTime: String) {
        timerDidUpdateCalled = true
        updatedRemainingTime = remainingTime
    }
    
    func timerDidEnd() {
        timerDidEndCalled = true
    }
    
    // TEST CASES //
    func testInitialRemainingTime() {
        XCTAssertEqual(timerModel.remainingMilliseconds, 100, "Initial remaining time should match the provided value.")
    }
    
    func testTimerUpdateIsCalled() {
        timerModel.startTimer()
        
        let expectation = self.expectation(description: "Wait for timerDidUpdate")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.02) {
            if self.timerDidUpdateCalled {
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 0.1, handler: nil)
        XCTAssertTrue(timerDidUpdateCalled, "timerDidUpdate should be called when the timer updates.")
    }
    
    func testTimerEndsCorrectly() {
        timerModel.startTimer()
        
        let expectation = self.expectation(description: "Wait for timerDidEnd")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            if self.timerDidEndCalled {
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 0.2, handler: nil)
        XCTAssertTrue(timerDidEndCalled, "timerDidEnd should be called when the timer reaches zero.")
    }
    
    func testTimerReset() {
        timerModel.startTimer()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            self.timerModel.reset()
            XCTAssertEqual(self.timerModel.remainingMilliseconds, 100, "After reset, remaining milliseconds should be set back to the initial value.")
        }
    }
}

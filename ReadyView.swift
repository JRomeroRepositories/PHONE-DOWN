//
//  Instruction.swift
//  PHONE-DOWN
//
//  Created by J. Romero on 2023-10-09.
//

import SwiftUI
import CoreMotion


struct ReadyView: View {
    
    @State private var timerIsActive = false
    @State private var secondsElapsed = 0
    @State private var timedone = 0
    @State private var displaying: ScreenState = .ready
    
// TODO: add grace period case
    // This is the case where the phone is picked up, but instead of showing the time elapsed immediately,
    // the user is given a few seconds to put the phone back down before displaying the timedone amount.
    // start by adding a case to the screenstate - remember to add a button during the grace period to
    // quickly skil out of the grace period and display/record time done.
    
    
    enum ScreenState {
        case ready
        case counting
        case displaydone
    }

    
    let motionManager = MotionManager()
    
    
    // Motion detection function prepped
    private func startMotionDetection() {
        motionManager.startUpdates { isFaceDown in
            DispatchQueue.main.async {
                if isFaceDown && !timerIsActive {
                    self.timerIsActive.toggle()
                    displaying = .counting
                } else if !isFaceDown && timerIsActive {
//                    let timeElapsedStart = secondsElapsed
//                    while (secondsElapsed < (timeElapsedStart + 10)) {
//                        displaying = .grace
//                    }
                    self.timerIsActive.toggle()
                    timedone = secondsElapsed
                    secondsElapsed = 0
                    displaying = .displaydone
                }
            }
        }
    }
    
    
    // View Control Flow
    var body: some View {
        ZStack {
            BackgroundColors()
            VStack {
                switch displaying {
                case .ready:
                    InstructionsView()
                case .counting:
                    CountingView(secondsElapsed: secondsElapsed)
                case .displaydone:
                    TimeDoneView(timedone: timedone)
                }
            }
        }
        // Timer
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect(), perform: { _ in
            guard timerIsActive else { return }
            secondsElapsed += 1
        })
        .onAppear {
            startMotionDetection()
        }
        .onDisappear {
            motionManager.stopUpdates()
        }
    }
}


#Preview {
    ReadyView()
}

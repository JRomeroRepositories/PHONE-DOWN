//
//  Instruction.swift
//  PHONE-DOWN
//
//  Created by J. Romero on 2023-10-09.
//

import SwiftUI
import CoreMotion


struct InstructionView: View {
    
    @State private var timerIsActive = false
    @State private var secondsElapsed = 0
    
    let motionManager = MotionManager()
    
    private func startMotionDetection() {
        motionManager.startUpdates { isFaceDown in
            if isFaceDown && !timerIsActive {
                self.timerIsActive.toggle()
            } else if !isFaceDown && timerIsActive {
                self.timerIsActive.toggle()
            }
        }
    }
    
    var body: some View {
        ZStack {
            BackgroundColors()
            VStack {
                Text("""
                    Place phone face-down on a clean flat surface
                    and get started immediately.
                    """)
                .font(.headline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                
                Text("\(secondsElapsed) seconds elapsed")
                    .font(.largeTitle)
                
                
                // Start/stop button
                Button( action: { self.timerIsActive.toggle()} )
                { Text(timerIsActive ? "Stop Timer" : "Start Timer") }
                
                //Reset Button
                Button(action: { secondsElapsed = 0 })
                { Text("Reset") }
                
                // Timer
                .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect(), perform: { _ in
                    guard timerIsActive else { return }
                    secondsElapsed += 1
                })
            }
        }
        .onAppear {
            startMotionDetection()
        }
        .onDisappear {
            motionManager.stopUpdates()
        }
    }
}


#Preview {
    InstructionView()
}

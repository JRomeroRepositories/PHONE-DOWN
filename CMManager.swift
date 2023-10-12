//
//  CMManager.swift
//  PHONE-DOWN
//
//  Created by J. Romero on 2023-10-11.
//

import Foundation
import CoreMotion

class MotionManager: ObservableObject {
    private var motionManager = CMMotionManager()
    
    func startUpdates(completion: @escaping (Bool) -> Void) {
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 1.0
            motionManager.startAccelerometerUpdates(to: .main) { (data, error) in
                guard let data = data else { return }
                
                // Check if the device is facing down
                let isFaceDown = data.acceleration.z > 0.9
                completion(isFaceDown)
            }
        }
    }
    
    func stopUpdates() {
        motionManager.stopAccelerometerUpdates()
    }
}

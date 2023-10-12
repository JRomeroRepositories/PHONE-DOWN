//
//  TimeNatLang.swift
//  PHONE-DOWN
//
//  Created by J. Romero on 2023-10-11.
//

import Foundation

// A function to display the seconds elapsed in natural language.
func TimeNatLang(secondsElapsed: Int) -> String{
    var displaystring = String("")
    let TimeMins = Int(secondsElapsed) / 60
    let TimeSecs = Int(secondsElapsed) % 60
    
    if (TimeSecs == 0) {
        displaystring = "\(TimeMins) minutes"
    } else if (TimeMins == 0) {
        displaystring = "\(TimeSecs) seconds"
    } else {
        displaystring = """
        \(TimeMins) minutes and
        \(TimeSecs) seconds
        """
    }
    return displaystring
}

//
//  Effect.swift
//  LightControl
//
//  Created by imac-2626 on 2023/5/20.
//

import Foundation

class Effect {
    static func effectCodeEncoder(lightCode: [String], time: [String]) -> String {
        var lightCodeWithTime: String = ""
        
        if lightCode.count == time.count {
            for index in 0...(lightCode.count - 1) {
                lightCodeWithTime = lightCodeWithTime + "\(lightCode[index]):\(time[index]) "
            }
            lightCodeWithTime.removeLast()
        }
        
        print(lightCodeWithTime)
        
        return lightCodeWithTime
    }
    
    static func effectCodeDecoder(effectCode: String) -> (lightCode: [String], time: [Double]) {
        let lightCodeWithTimes = effectCode.components(separatedBy: " ")
        
        var lightCode: [String] = []
        var time: [Double] = []
        
        for lightCodeWithTime in lightCodeWithTimes {
            let lightCodeAndTime = lightCodeWithTime.components(separatedBy: ":")
            
            lightCode.append(lightCodeAndTime[0])
            time.append(Double(lightCodeAndTime[1])!)
        }
        
        return (lightCode, time)
    }
    
    static func countTotalTime(times: [Double]) -> Double {
        var totalTime: Double = 0
        
        for time in times {
            totalTime += time
        }
        
        return totalTime
    }
    
    static func effectBoolToString(bools: [Bool]) -> String {
        var effectString = ""
        
        for bool in 0...8 {
            if bools[bool] {
                effectString += "\(bool + 1)"
            }
        }
        
        return effectString
    }
 }

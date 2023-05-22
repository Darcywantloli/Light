//
//  Effect.swift
//  LightControl
//
//  Created by imac-2626 on 2023/5/20.
//

import Foundation

class Effect {
    static func effectCodeEncoder(lightCode: [String]) -> String {
        
        return "d"
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
}

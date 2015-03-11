//
//  LionCub.swift
//  LionsAndTigers
//
//  Created by Dirk Boller on 11.03.15.
//  Copyright (c) 2015 Dirk Boller. All rights reserved.
//

import Foundation

class LionCub: Lion {
    func rubLionCubsBelly () {
        println("LionCub: Snuggle and be happy")
    }
    
    override func roar () {
        super.roar()
        println("LionCub: Growl Growl")
    }
    
    override func randomFact() -> String {
        var randomFactString = ""
        
        if isAlphaMale {
            randomFactString = "Löwenkinder verstecken sich gewöhnlich für 6 Wochen in den Büschen"
        }
        else {
            randomFactString = "Löwenkinder fangen normalerweise mit etwa 6 Wochen an Fleisch zu essen"
        }
        return randomFactString
    }
}
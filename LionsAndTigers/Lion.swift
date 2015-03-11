//
//  Lion.swift
//  LionsAndTigers
//
//  Created by Dirk Boller on 11.03.15.
//  Copyright (c) 2015 Dirk Boller. All rights reserved.
//

import Foundation
import UIKit

class Lion {
    var age = 0
    var isAlphaMale = false
    var image = UIImage(named:"")
    var name = ""
    var subspecies = ""
    
    func roar () {
        println("Lion: Roar Roar")
    }
    
    func changeToAlphaMale () {
        self.isAlphaMale = true
    }
    
    func randomFact() -> String {
        var randomFact:String
        
        if self.isAlphaMale {
            randomFact = "Männliche Löwen sind dank Ihrer Mähne leicht zu erkennen. Männchen mit dunkler Mähne sind für Weibchen attraktver."
        }
        else {
            randomFact = "Weibliche Löwen sind die stabile soziale Komponente und tolerieren keine fremden Weibchen."
        }
        return randomFact
    }
}
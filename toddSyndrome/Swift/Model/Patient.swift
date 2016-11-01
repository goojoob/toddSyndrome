//
//  patient.swift
//  toddSyndrome
//
//  Created by Antonio Rodriguez Cia on 30/10/16.
//  Copyright © 2016 Goojoob. All rights reserved.
//

import Foundation

enum Gender: Int {
    case Male,Female
}

public class Patient {
    private let name:NSString
    private let age:Int
    private let haveMigraines:Bool
    private let useHallucinogenicDrugs:Bool
    private let gender:Gender
    private var probability:Int
    
    init(name:NSString, age:Int, haveMigraines:Bool, useDrugs:Bool, gender:Gender) {
        self.name = name
        self.age = age
        self.haveMigraines = haveMigraines
        self.useHallucinogenicDrugs = useDrugs
        self.gender = gender
        self.probability = 0
        
        self.toddsProbability()
    }
    
    private func toddsProbability() {
        if self.haveMigraines == true {
            self.increaseProbability(value:25)
        }
        if self.age<=15 {
            self.increaseProbability(value:25)
        }
        if self.gender == Gender.Male {
            self.increaseProbability(value:25)
        }
        if self.useHallucinogenicDrugs == true {
            self.increaseProbability(value:25)
        }
    }
    
    private func increaseProbability(value:Int) {
        self.probability = self.probability + value
    }
    
    
    public func howLikelyIsToToddsSyndromeCondition() -> Int {
        return self.probability
    }
    
    public func getName() -> NSString {
        return self.name
    }
}

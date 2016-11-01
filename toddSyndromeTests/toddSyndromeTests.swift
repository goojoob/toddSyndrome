//
//  toddSyndromeTests.swift
//  toddSyndromeTests
//
//  Created by Antonio Rodriguez Cia on 1/11/16.
//  Copyright © 2016 Goojoob. All rights reserved.
//

import XCTest
@testable import toddSyndrome

class toddSyndromeTests: XCTestCase {
    
    var patient:Patient?
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMalePatient() {
        self.patient = Patient(name: "John", age: 15, haveMigraines: true, useDrugs: false, gender: Gender.Male)
        let conditionValue = self.patient?.howLikelyIsToToddsSyndromeCondition()
        XCTAssert(conditionValue == 75)
    }
    
    func testFemalePatient() {
        self.patient = Patient(name: "Laura", age: 20, haveMigraines: false, useDrugs: true, gender: Gender.Female)
        let conditionValue = self.patient?.howLikelyIsToToddsSyndromeCondition()
        XCTAssert(conditionValue == 25)
    }
    
    func testPatientName() {
        self.patient = Patient(name: "Laura", age: 20, haveMigraines: false, useDrugs: true, gender: Gender.Female)
        let patientName = self.patient!.getName()
        XCTAssert(patientName == "Laura")
    }
    
}

//
//  AddPatientController.swift
//  toddSyndrome
//
//  Created by Antonio Rodriguez Cia on 30/10/16.
//  Copyright © 2016 Goojoob. All rights reserved.
//

import UIKit

class AddPatientController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var checkDiagnosisButton: UIButton!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var ageInput: UITextField!
    @IBOutlet weak var genderSwitch: UISegmentedControl!
    @IBOutlet weak var migrainesSwitch: UISwitch!
    @IBOutlet weak var drugsSwitch: UISwitch!
    @IBOutlet weak var diagnosisResult: UILabel!
    
    public var patient:Patient?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addDelegates()
        self.addToolBarOnNumericKeyboard()
        self.addGestureRecognizers()
        self.restoreData()
    }
    
    private func addDelegates() {
        self.nameInput.delegate = self
        self.ageInput.delegate = self
    }
    
    private func restoreData() {
        self.saveButton.isEnabled = false
        self.checkDiagnosisButton.isEnabled = false
        self.diagnosisResult.text = "Please fill all fields to get the diagnosis"
        self.migrainesSwitch.isOn = false
        self.drugsSwitch.isOn = false
    }
    
    
    
    //THE KEYBOARD DISAPPEAR WHEN TAPPING OUTSIDE

    private func addGestureRecognizers() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        self.view.addGestureRecognizer(tap)
    }

    public func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    
    //NAVIGATE BETWEEN TEXTFIELDS USING KEYBOARD RETURN AND TOOLBAR
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameInput {
            self.focusOnAgeTextField()
        } else if textField == ageInput {
            self.hideKeyboard()
        }
        
        return true
    }
    
    func focusOnAgeTextField() {
        nameInput.resignFirstResponder()
        ageInput.becomeFirstResponder()
    }
    
    func focusOnNameTextField() {
        ageInput.resignFirstResponder()
        nameInput.becomeFirstResponder()
    }
    
    private func addToolBarOnNumericKeyboard() {
        let doneToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle = UIBarStyle.default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.focusOnNameTextField))
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.doneButtonHideKeyboard))
        
        var items = [UIBarButtonItem]()
        items.append(backButton)
        items.append(flexSpace)
        items.append(doneButton)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.ageInput.inputAccessoryView = doneToolbar
    }
    
    public func doneButtonHideKeyboard() {
        self.ageInput.resignFirstResponder()
    }
    
    
    
    
    //CHECK CORRECT DATA
    
    @IBAction func endEditingName(_ sender: AnyObject) {
        self.toggleButtonsIfDataIsFilledOK()
    }
    
    @IBAction func endEditingAge(_ sender: AnyObject) {
        self.toggleButtonsIfDataIsFilledOK()
    }
    
    private func toggleButtonsIfDataIsFilledOK() {
        if self.checkDataIsFilledOK() {
            self.enablePatientButtons()
        } else {
            self.restoreData()
        }
    }
    
    private func checkDataIsFilledOK() -> Bool {
        if self.nameInput.text!.isEmpty || self.ageInput.text!.isEmpty {
            return false
        } else {
            if self.ageInput.text!.isNumber {
                return true
            } else {
                return false
            }
        }
    }
    
    private func enablePatientButtons() {
        self.saveButton.isEnabled = true
        self.checkDiagnosisButton.isEnabled = true
    }
    
    
    

    //CREATE PATIENT AND GET DIAGNOSIS
    
    @IBAction func checkDiagnosis(_ sender: AnyObject) {
        if self.checkDataIsFilledOK() {
            self.createPatient()
            self.showPatientDiagnosisInLabel()
        }
    }
    
    private func createPatient() {
        let patientName = self.nameInput.text! as NSString
        let patientAge = Int(self.ageInput.text!)!
        let selectedGender = self.genderSwitch.selectedSegmentIndex
        let patientGender = Gender(rawValue: selectedGender)!
        let patientMigraines = self.migrainesSwitch.isOn
        let patientDrugs = self.drugsSwitch.isOn
        
        self.patient = Patient(name: patientName, age: patientAge, haveMigraines: patientMigraines, useDrugs: patientDrugs, gender: patientGender)
    }
    
    private func showPatientDiagnosisInLabel() {
        self.diagnosisResult.text = "The probability that \(self.patient!.getName()) has Todd's Syndrome is \(self.patient!.howLikelyIsToToddsSyndromeCondition())%"
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "savePatient" {
            if self.checkDataIsFilledOK() {
                self.createPatient()
            }
        }
    }
    
    
    
    
    //BUILD THE STATIC TABLE
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 2
        case 2:
            return 2
        default:
            return 0
        }
    }

    
    

}

//
//  ToddsSyndromeController.swift
//  toddSyndrome
//
//  Created by Antonio Rodriguez Cia on 30/10/16.
//  Copyright © 2016 Goojoob. All rights reserved.
//

import UIKit

class ToddsSyndromeController: UITableViewController {
    
    var patientsTested:[[String: Any]] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getPatientArrayFromDataPersistence()
    }
    
    
    
    
    //BUILD THE DINAMIC TABLE

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.patientsTested.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "patientCell", for: indexPath)
        
        cell.textLabel?.text = "\(self.patientsTested[indexPath.row]["patientName"]!)"
        cell.detailTextLabel?.text = "\(self.patientsTested[indexPath.row]["patientCondition"]!)%"
        
        return cell
    }

    
    
    
    //DATA PERSISTENCE
    
    private func savePatientsArrayToDataPersistence() {
        let defaults = UserDefaults.standard
        defaults.set(self.patientsTested, forKey: "patientsArray")
        defaults.synchronize()
    }
    
    private func getPatientArrayFromDataPersistence() {
        let defaults = UserDefaults.standard
        self.patientsTested = defaults.object(forKey: "patientsArray") as? [[String : Any]] ?? []
    }
    
    
    
    
    //SEGUES FROM THE ADD PATIENT WINDOW

    @IBAction func cancelNewPatient(segue:UIStoryboardSegue) {
    }

    @IBAction func savePatient(segue:UIStoryboardSegue) {
        if let newPatientViewController = segue.source as? AddPatientController {
            if let patient = newPatientViewController.patient {
                self.saveIntoTested(patient: patient)
                self.reloadTableData()
            }
        }
    }
    
    private func saveIntoTested(patient:Patient) {
        self.patientsTested.append(["patientName":patient.getName(), "patientCondition":patient.howLikelyIsToToddsSyndromeCondition()])
        self.savePatientsArrayToDataPersistence()
    }
    
    private func reloadTableData() {
        self.tableView.reloadData()
    }

}

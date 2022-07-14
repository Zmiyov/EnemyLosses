//
//  DetailsViewController.swift
//  EnemyLosses
//
//  Created by Vladimir Pisarenko on 13.07.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var amountOfPersonnelLabel: UILabel!
    @IBOutlet var amountOfAircraftsLabel: UILabel!
    @IBOutlet var amountOfHelicoptersLabel: UILabel!
    @IBOutlet var amountOfTanksLabel: UILabel!
    @IBOutlet var amountOfApcLabel: UILabel!
    @IBOutlet var amountOfFieldArtilleryLabel: UILabel!
    @IBOutlet var amountOfMrlLabel: UILabel!
    @IBOutlet var amountOfMilitaryAutoLabel: UILabel!
    @IBOutlet var amountOfFuelTanksLabel: UILabel!
    @IBOutlet var amountOfDronesLabel: UILabel!
    @IBOutlet var amountOfNavalShipsLabel: UILabel!
    @IBOutlet var amountOfAntiAircraftWareFareLabel: UILabel!
    @IBOutlet var amountOfSpecialEquipmentLabel: UILabel!
    @IBOutlet var amountOfMobileSRBMSystemsLabel: UILabel!
    @IBOutlet var amountOfVehiclesAndFuelTanksLabel: UILabel!
    @IBOutlet var amountOfCruiseMissilesLabel: UILabel!
    
    var equipment: Equipment
    var personnel: Int
    
    init?(coder:NSCoder, equipment: Equipment, personnel: Int) {
        self.equipment = equipment
        self.personnel = personnel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        
        dateLabel.text = dateFormatter.string(from: equipment.date)
        amountOfPersonnelLabel.text = String(personnel)
        amountOfAircraftsLabel.text = String(equipment.aircraft)
        amountOfHelicoptersLabel.text = String(equipment.helicopter)
        amountOfTanksLabel.text = String(equipment.tank)
        amountOfApcLabel.text = String(equipment.apc)
        amountOfFieldArtilleryLabel.text = String(equipment.fieldArtillery)
        amountOfMrlLabel.text = String(equipment.mrl)
        
        if let amountOfMilitaryAuto = equipment.militaryAuto {
            amountOfMilitaryAutoLabel.text = String(amountOfMilitaryAuto)
        } else {
            amountOfMilitaryAutoLabel.text = "N/A"
        }
        if let amountOfFuelTanks = equipment.fuelTank {
            amountOfFuelTanksLabel.text = String(amountOfFuelTanks)
        } else {
            amountOfFuelTanksLabel.text = "N/A"
        }
       
        amountOfDronesLabel.text = String(equipment.drone)
        amountOfNavalShipsLabel.text = String(equipment.navalShip)
        amountOfAntiAircraftWareFareLabel.text = String(equipment.antiAircraftWareFare)
        
        if let amountOfSpecialEquipment = equipment.specialEquipment {
            amountOfSpecialEquipmentLabel.text = String(amountOfSpecialEquipment)
        } else {
            amountOfSpecialEquipmentLabel.text = "N/A"
        }
            
        if let amountOfMobileSRBMSystems = equipment.mobileSRBMSystem {
            amountOfMobileSRBMSystemsLabel.text = String(amountOfMobileSRBMSystems)
        } else {
            amountOfMobileSRBMSystemsLabel.text = "N/A"
        }
        
        if let amountOfVehiclesAndFuelTanks = equipment.vehiclesAndFuelTanks {
            amountOfVehiclesAndFuelTanksLabel.text = String(amountOfVehiclesAndFuelTanks)
        } else {
            amountOfVehiclesAndFuelTanksLabel.text = "N/A"
        }
        
        if let amountOfCruiseMissiles = equipment.cruiseMissiles {
            amountOfCruiseMissilesLabel.text = String(amountOfCruiseMissiles)
        } else {
            amountOfCruiseMissilesLabel.text = "N/A"
        }
    }

}

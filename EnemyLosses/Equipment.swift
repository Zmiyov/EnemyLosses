//
//  Equipment.swift
//  EnemyLosses
//
//  Created by Vladimir Pisarenko on 13.07.2022.
//

import Foundation

struct Equipment: Codable {
    var date: String
    var day: Int
    var aircraft: Int
    var helicopter: Int
    var tank: Int
    var apc: Int
    var fieldArtillery: Int
    var mrl: Int
    var militaryAuto: Int?
    var fuelTank: Int?
    var drone: Int
    var navalShip: Int
    var antiAircraftWareFare: Int
    var specialEquipment: Int?
    var mobileSRBMSystem: Int?
    var vehiclesAndFuelTanks: Int?
    var cruiseMissiles: Int?
    
    enum CodingKeys: String, CodingKey {
        case date
        case day
        case aircraft
        case helicopter
        case tank
        case apc = "APC"
        case fieldArtillery = "field artillery"
        case mrl = "MRL"
        case militaryAuto = "military auto"
        case fuelTank = "fuel tank"
        case drone
        case navalShip = "naval ship"
        case antiAircraftWareFare = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case mobileSRBMSystem = "mobile SRBM system"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
        case cruiseMissiles = "cruise missiles"
    }
    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        self.date = try values.decode(String.self, forKey: .date)
//        self.day = try values.decode(Int.self, forKey: .day)
//        aircraft = try values.decode(Int.self, forKey: .aircraft)
//        helicopter = try values.decode(Int.self, forKey: .helicopter)
//        tank = try values.decode(Int.self, forKey: .tank)
//        apc = try values.decode(Int.self, forKey: .apc)
//        fieldArtillery = try values.decode(Int.self, forKey: .fieldArtillery)
//        mrl = try values.decode(Int.self, forKey: .mrl)
//        militaryAuto = try values.decode(Int.self, forKey: .militaryAuto)
//
//        if let militaryAuto = try? values.decode(Int.self, forKey: .militaryAuto) {
//            self.militaryAuto = militaryAuto
//        } else {
//            self.militaryAuto = nil
//        }
//        fuelTank = try values.decode(Int.self, forKey: .fuelTank)
//
//        if let fuelTank = try? values.decode(Int.self, forKey: .fuelTank) {
//            self.fuelTank = fuelTank
//        } else {
//            self.fuelTank = nil
//        }
//
//        drone = try values.decode(Int.self, forKey: .drone)
//        navalShip = try values.decode(Int.self, forKey: .navalShip)
//        antiAircraftWareFare = try values.decode(Int.self, forKey: .antiAircraftWareFare)
//        specialEquipment = try values.decode(Int.self, forKey: .specialEquipment)
//        mobileSRBMSystem = try values.decode(Int.self, forKey: .mobileSRBMSystem)
//
//        if let mobileSRBMSystem = try? values.decode(Int.self, forKey: .mobileSRBMSystem) {
//            self.mobileSRBMSystem = mobileSRBMSystem
//        } else {
//            self.mobileSRBMSystem = nil
//        }
//
//        vehiclesAndFuelTanks = try values.decode(Int.self, forKey: .vehiclesAndFuelTanks)
//        cruiseMissiles = try values.decode(Int.self, forKey: .cruiseMissiles)
//    }
}

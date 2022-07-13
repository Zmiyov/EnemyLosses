//
//  Personnel.swift
//  EnemyLosses
//
//  Created by Vladimir Pisarenko on 13.07.2022.
//

import Foundation

struct Personnel: Codable {
    var date: String
    var day: Int
    var personnel: Int
    var pow: Int
    
    enum CodingKeys: String, CodingKey {
        case date
        case day
        case personnel
        case pow = "POW"
    }
}


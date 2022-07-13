//
//  NetworkController.swift
//  EnemyLosses
//
//  Created by Vladimir Pisarenko on 13.07.2022.
//

import Foundation

class NetworkController {
    
    enum StoreItemError: Error, LocalizedError {
        case personnelItemNotFound
        case equipmentItemNotFound
    }
    
    func fetchPersonnel() async throws -> [Personnel] {
        let urlComponents = URLComponents(string: "https://github.com/MacPaw/2022-Ukraine-Russia-War-Dataset/blob/main/data/russia_losses_personnel.json")!
        
        let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw StoreItemError.personnelItemNotFound
        }
        let decoder = JSONDecoder()
        let personnelResponse = try decoder.decode([Personnel].self, from: data)
        return personnelResponse
    }
    
    func fetchEquipment() async throws -> [Equipment] {
        let urlComponents = URLComponents(string: "https://github.com/MacPaw/2022-Ukraine-Russia-War-Dataset/blob/main/data/russia_losses_equipment.json")!
        
        let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw StoreItemError.equipmentItemNotFound
        }
        let decoder = JSONDecoder()
        let equipmentResponse = try decoder.decode([Equipment].self, from: data)
        return equipmentResponse
    }
}

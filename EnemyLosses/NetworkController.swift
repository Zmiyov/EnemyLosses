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
        let urlComponents = URLComponents(string: "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_personnel.json")!
        
        let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw StoreItemError.personnelItemNotFound
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        let personnelResponse = try decoder.decode([Personnel].self, from: data)

        return personnelResponse
    }
    
    func fetchEquipment() async throws -> [Equipment] {
        let urlComponents = URLComponents(string: "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment.json")!
        
        let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw StoreItemError.equipmentItemNotFound
        }
        let stringJson = String(decoding: data, as: UTF8.self)
        let correctStringJson = stringJson.replacingOccurrences(of: "NaN", with: "null")
        let correctData = Data(correctStringJson.utf8)
        
        let decoder = JSONDecoder()
        let equipmentResponse = try decoder.decode([Equipment].self, from: correctData)
        
        return equipmentResponse
    }
}

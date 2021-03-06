//
//  DatesTableViewController.swift
//  EnemyLosses
//
//  Created by Vladimir Pisarenko on 13.07.2022.
//

import UIKit

class DatesTableViewController: UITableViewController {
    
    var personnelsItems = [Personnel]()
    var equipmentsItems = [Equipment]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPersonnelItems()
        fetchEquipmentItems()
    }
    
    func fetchPersonnelItems() {
        let networkController = NetworkController()
        
        Task {
            do {
                let fetchedItems = try await networkController.fetchPersonnel()
                self.personnelsItems = fetchedItems
                self.tableView.reloadData()
            } catch {
                print("Error fetching data personnel: \(error)")
            }
        }
    }
    
    func fetchEquipmentItems() {
        let networkController = NetworkController()
        
        Task {
            do {
                let fetchedItems = try await networkController.fetchEquipment()
                self.equipmentsItems = fetchedItems
            } catch {
                print("Error fetching data equipment: \(error)")
            }
        }
    }
    
    @IBSegueAction func showDetails(_ coder: NSCoder, sender: Any?) -> DetailsViewController? {
        
        guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else {
            return nil
        }
        let dayFromPersonnels = personnelsItems[indexPath.row].day
        
        guard let equipmentItem = equipmentsItems.first(where: { $0.day == dayFromPersonnels }) else {
            return nil
        }
        let personnelAmount = personnelsItems[indexPath.row].personnel
        
        return DetailsViewController(coder: coder, equipment: equipmentItem, personnel: personnelAmount)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personnelsItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dates", for: indexPath)
        let dateItem = personnelsItems[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"

        var content = cell.defaultContentConfiguration()
        content.text = dateFormatter.string(from: dateItem.date)
        content.secondaryText = String(dateItem.day) + " " + "Day"
        cell.contentConfiguration = content

        return cell
    }
}


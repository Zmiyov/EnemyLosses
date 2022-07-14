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
        
        guard let index = equipmentsItems.first(where: { $0.day == dayFromPersonnels }) else { return nil }
        let item = index
        
        return DetailsViewController(coder: coder, equipment: item)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return personnelsItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dates", for: indexPath)
        let dateItem = personnelsItems[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"

        var content = cell.defaultContentConfiguration()
        content.text = String(dateItem.day) + " " + "Day"
        content.secondaryText = dateFormatter.string(from: dateItem.date)
        cell.contentConfiguration = content

        return cell
    }

}

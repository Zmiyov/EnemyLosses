//
//  DetailsViewController.swift
//  EnemyLosses
//
//  Created by Vladimir Pisarenko on 13.07.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var dateLabel: UILabel!
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
    
    
    var equipment = [Equipment]()
    var personnel: Personnel
    
    init?(coder:NSCoder, personnel: Personnel) {
        self.personnel = personnel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

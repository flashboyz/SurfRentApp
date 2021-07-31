//
//  RentTableViewController.swift
//  SurfRentApp
//
//  Created by Daniil Belyaev on 30.07.2021.
//

import UIKit

class RentTableViewController: UITableViewController {

<<<<<<< HEAD
    let images = ["KAYAK BIC Duassou", "SUP BIC 9'2", "SUP BIC 10'6", "SUP Gladiator 17'", "SUP JP-Australia 10'2", "SUP SIC 9'2", "SUP SIC 11'6", "SUP Starboard 12'0"]
=======
    let images = ["SUP Starboard 12'0", "KAYAK BIC Duassou", "SUP BIC 9'2", "SUP BIC 10'6", "SUP Gladiator 17'", "SUP JP-Australia 10'2", "SUP SIC 9'2", "SUP SIC 11'6"]
>>>>>>> Settings
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return images.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RentTableViewCell

        cell.myName.text = images[indexPath.row]
        cell.myStatus.text = "Доступно"
        cell.myStatus.textColor = .green
        cell.myImage.image = UIImage(named: images[indexPath.row])
        
        return cell
    }
}

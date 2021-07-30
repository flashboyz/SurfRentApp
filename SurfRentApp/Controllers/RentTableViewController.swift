//
//  RentTableViewController.swift
//  SurfRentApp
//
//  Created by Daniil Belyaev on 30.07.2021.
//

import UIKit

class RentTableViewController: UITableViewController {

    let images = ["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth"]
    
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

        cell.myImage.image = UIImage(named: images[indexPath.row])
        
        return cell
    }
}

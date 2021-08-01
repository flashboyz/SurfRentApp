//
//  RentTableViewController.swift
//  SurfRentApp
//
//  Created by Daniil Belyaev on 30.07.2021.
//

import UIKit

class RentTableViewController: UITableViewController {

//<<<<<<< HEAD
    var item = 0
    var itemModel = Item(name: "", index: 0)

    var items = [Item(name: "KAYAK BIC Duassou", index: 0), Item(name: "SUP BIC 9'2", index: 1), Item(name: "SUP BIC 10'6", index: 2), Item(name: "SUP Gladiator 17'", index: 3), Item(name:  "SUP JP-Australia 10'2", index: 4), Item(name:  "SUP SIC 9'2", index: 5), Item(name: "SUP SIC 11'6", index: 6), Item(name: "SUP Starboard 12'0", index: 7)]
    
//    let images = ["KAYAK BIC Duassou", "SUP BIC 9'2", "SUP BIC 10'6", "SUP Gladiator 17'", "SUP JP-Australia 10'2", "SUP SIC 9'2", "SUP SIC 11'6", "SUP Starboard 12'0"]
//=======
//    let images = ["SUP Starboard 12'0", "KAYAK BIC Duassou", "SUP BIC 9'2", "SUP BIC 10'6", "SUP Gladiator 17'", "SUP JP-Australia 10'2", "SUP SIC 9'2", "SUP SIC 11'6"]
//>>>>>>> Settings
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(itemModel)
    }
    
    func updateItem(index: Int) {
        items.remove(at: index)
        items.insert(itemModel, at: index)
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RentTableViewCell

        cell.myName.text = items[indexPath.row].name
        cell.myStatus.text = items[indexPath.row].status
        switch cell.myStatus.text {
        case "Забронировано":
            cell.myStatus.textColor = .orange
        case "Оплачено":
            cell.myStatus.textColor = .red
        default:
            cell.myStatus.textColor = .green

        }
    
        cell.myImage.image = UIImage(named: items[indexPath.row].name)
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        item = indexPath.row
        performSegue(withIdentifier: "goToSettings", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let unlockAction = UITableViewRowAction(style: .normal, title: "Разбронировать") { act, indexPath in
            self.items[indexPath.row].status = "Доступно"
            self.tableView.reloadData()
        }
        let infoAction = UITableViewRowAction(style: .normal, title: "Информация") { act, indexPath in
            let alert = UIAlertController(title: "Информация", message: "Имя: \(self.items[indexPath.row].nameOfOwner), Время: \(self.items[indexPath.row].time), Телефон: \(self.items[indexPath.row].number)", preferredStyle: .alert
            )
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
        let noAction = UITableViewRowAction(style: .normal, title: "Не забронировано") { UITableViewRowAction, IndexPath in
            self.dismiss(animated: true, completion: nil)
        }
        
        
        if items[indexPath.row].status == "Доступно" {
            return [noAction]
        } else {
            return [infoAction, unlockAction]
        }

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goToSettings" else {return}
        guard let destinationVC = segue.destination as? SettingsViewController else {return}
        destinationVC.item = items[item].name
        destinationVC.index = item
    }
    
    
    @IBAction func unwindToRent(_ sender: UIStoryboardSegue) {
        
    }
}

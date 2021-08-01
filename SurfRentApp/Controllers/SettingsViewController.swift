//
//  SettingsViewController.swift
//  SurfRentApp
//
//  Created by Daniil Belyaev on 30.07.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var rentPriceLabel: UILabel!
    @IBOutlet weak var numberOfInventoryLabel: UILabel!
    @IBOutlet weak var nameOfInventoryLabel: UILabel!
    
    @IBOutlet weak var rentalNameTF: UITextField!
    @IBOutlet weak var rentalSurnameTF: UITextField!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var rentalPhoneNumberTF: UITextField!
    
    @IBOutlet weak var priceSegmentedControl: UISegmentedControl!
    var item = ""
    var price = 0
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.nameOfInventoryLabel.text = self.item
            self.previewImage.image = UIImage(named: self.item)
        }

        
        
        previewImage.layer.cornerRadius = 15
        minusButton.layer.cornerRadius = 10
        plusButton.layer.cornerRadius = 10
//        price = rentPriceLabel.text as! Int * numberOfInventoryLabel.text as! Int

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goBack", sender: self)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goBack" else {return}
        guard let destinationVC = segue.destination as? RentTableViewController else {return}
        destinationVC.itemModel.name = nameOfInventoryLabel.text ?? ""
        destinationVC.itemModel.nameOfOwner = "\(rentalNameTF.text ?? "Name") \(rentalSurnameTF.text ?? "Surname")"
        destinationVC.itemModel.cost = ""
        if mySwitch.isOn {
            destinationVC.itemModel.status = "Оплачено"
        } else {
            destinationVC.itemModel.status = "Забронировано"
        }
        destinationVC.itemModel.number = rentalPhoneNumberTF.text ?? "No phone number"

        switch priceSegmentedControl.selectedSegmentIndex {
        case 1:
            destinationVC.itemModel.time = "2 часа"
        case 2:
            destinationVC.itemModel.time = "3 часа"
        case 3:
            destinationVC.itemModel.time = "Сутки"

        default:
            destinationVC.itemModel.time = "1 час"
        }
        
        
        destinationVC.updateItem(index: index)
        destinationVC.tableView.reloadData()

        
    }
    
}

//
//  SettingsViewController.swift
//  SurfRentApp
//
//  Created by Daniil Belyaev on 30.07.2021.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    
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
    
    private var numberOfInventory = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rentalNameTF.delegate = self
        rentalSurnameTF.delegate = self
        rentalPhoneNumberTF.delegate = self
        
        DispatchQueue.main.async {
            self.nameOfInventoryLabel.text = self.item
            self.previewImage.image = UIImage(named: self.item)
        }
        
        previewImage.layer.cornerRadius = 15
        minusButton.layer.cornerRadius = 10
        plusButton.layer.cornerRadius = 10
//        price = rentPriceLabel.text as! Int * numberOfInventoryLabel.text as! Int

    
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goBack", sender: self)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func increaseButtonPressed(_ sender: UIButton) {
        var rentPrice = 500
        if sender.tag == 0 {
            numberOfInventory -= 1
            rentPrice = rentPrice * numberOfInventory
            numberOfInventoryLabel.text = "\(numberOfInventory)"
            rentPriceLabel.text = "\(rentPrice)"
            
        } else if sender.tag == 1 {
            numberOfInventory += 1
            rentPrice = rentPrice * numberOfInventory
            numberOfInventoryLabel.text = "\(numberOfInventory)"
            rentPriceLabel.text = "\(rentPrice)"
        } else {return}
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

//MARK: -extension for ViewController

extension SettingsViewController {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    
}

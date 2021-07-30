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
    @IBOutlet weak var rentalPhoneNumberTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previewImage.layer.cornerRadius = 15
        minusButton.layer.cornerRadius = 10
        plusButton.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view.
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

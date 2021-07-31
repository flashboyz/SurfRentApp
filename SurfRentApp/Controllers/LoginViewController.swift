//
//  ViewController.swift
//  SurfRentApp
//
//  Created by Daniil Belyaev on 30.07.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let account = Account.getUser()
    
    @IBOutlet weak var buttonPressed: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonPressed.layer.cornerRadius = 15
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
    @IBAction func buttonPressedAсtion(_ sender: Any) {
        showAlert()
    }
}

extension LoginViewController {
    private func showAlert () {
        let alert = UIAlertController(title: "Введите данные",
                                      message: "Введите ваш логин и пароль", preferredStyle: .alert)
        alert.addTextField()
        alert.addTextField()
        alert.textFields![0].placeholder = "Введите логин"
        alert.textFields![0].keyboardType = .emailAddress
        alert.textFields![1].placeholder = "Введите пароль"
        alert.textFields![1].isSecureTextEntry = true
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: {(action) in print("Отмена")
        }))
        alert.addAction(UIAlertAction(title: "ОК", style: .default))
        self.present(alert, animated: true)
    }
}


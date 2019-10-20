//
//  AddCarViewController.swift
//  cars
//
//  Created by Анна Арзуманян on 20/10/2019.
//  Copyright © 2019 Анна Арзуманян. All rights reserved.
//

import UIKit

class AddCarViewController: UIViewController {

    @IBOutlet weak var markTextField: UITextField! // связываем текстовые поля с кодом
   
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var wheelDriveTextField: UITextField!
    @IBOutlet weak var powerTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    
    var parentVC : MyTableViewController? // задаем родительский ViewConroller, чтобы потом передать ему данные
    
    @IBAction func addButtonPressed(_ sender: Any) { // код, выполняемый при нажатии на кнопку "добавить"
        let car = Car(mark: markTextField.text ?? "",
                      model: modelTextField.text ?? "",
                      year: Int(yearTextField.text ?? "") ?? 0,
                      power: Int(powerTextField.text ?? "") ?? 0,
                      wheelDrive: wheelDriveTextField.text ?? "",
                      type: typeTextField.text ?? "")
        parentVC?.carAdded = true
        parentVC?.newCar = car
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) { // код, выполняемый при нажатии на кнопку "отмена"
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

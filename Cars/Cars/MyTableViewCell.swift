//
//  MyTableViewCell.swift
//  cars
//
//  Created by Анна Арзуманян on 20/10/2019.
//  Copyright © 2019 Анна Арзуманян. All rights reserved.
//

import UIKit


class MyTableViewCell: UITableViewCell { // класс шаблона ячейки дла таблицы с автомобилями
    
    @IBOutlet weak var markLabel: UILabel! // связываем элементы ячейки с кодом
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var yearlabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var wheelDriveLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    
    func setup(car: Car){ // метод, в котором настраиваются и заполняются текстовые поля
        self.markLabel.text = (car.mark ?? "") + ","
        self.modelLabel.text = (car.model ?? "") + ","
        self.powerLabel.text = String(car.power ?? 0)+" л.с."
        self.typeLabel.text = car.type
        self.wheelDriveLabel.text = (car.wheelDrive ?? "") + ","
        self.yearlabel.text = "\(car.year ?? 0) год"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


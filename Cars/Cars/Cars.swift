//
//  Cars.swift
//  cars
//
//  Created by Анна Арзуманян on 20/10/2019.
//  Copyright © 2019 Анна Арзуманян. All rights reserved.
//

import Foundation


class Car { // класс Автомобиля для использования в таблице
    let mark : String? // описываем поля и типы
    let model : String?
    let year : Int?
    let power : Int?
    let wheelDrive : String?
    let type : String?
    
    init(mark: String, model: String, year: Int, power: Int, wheelDrive: String, type: String) { // пишем инициализацию класса
        self.mark = mark
        self.model = model
        self.year = year
        self.power = power
        self.wheelDrive = wheelDrive
        self.type = type
    }
}

class CarData { // класс используемый для хранения данных в памяти
    static let markKey = "MARK" // список ключей, по которым будет храниться информация об автомобилях
    static let modelKey = "MODEL"
    static let yearKey = "YEAR"
    static let powerKey = "POWER"
    static let wheelDriveKey = "WHEELDRIVE"
    static let typeKey = "TYPE"
    static let amountKey = "AMOUNT"
    
    static func saveCars(cars: [Car]){ // функция, сохраняющая массив автомобилей в память
        var marks = [String]() // создаем массивы для каждого поля
        var models = [String]()
        var years = [Int]()
        var power = [Int]()
        var wheelDrive = [String]()
        var type = [String]()
        
        cars.forEach { (car) in // заполняем массивы
            marks.append(car.mark ?? "")
            models.append(car.mark ?? "")
            years.append(car.year ?? 0)
            power.append(car.power ?? 0)
            wheelDrive.append(car.wheelDrive ?? "")
            type.append(car.type ?? "")
        
        }
        UserDefaults.standard.set(marks, forKey: markKey) // сохраняем массивы и количество автомобилей
        UserDefaults.standard.set(models, forKey: modelKey)
        UserDefaults.standard.set(years, forKey: yearKey)
        UserDefaults.standard.set(power, forKey: powerKey)
        UserDefaults.standard.set(wheelDrive, forKey: wheelDriveKey)
        UserDefaults.standard.set(type, forKey: typeKey)
        UserDefaults.standard.set(cars.count, forKey: amountKey)
    }
    
    static func getCars() -> [Car] { // функция, возвращающая нам массив автомобитей из памяти
        var cars: [Car] = []
        let marks = UserDefaults.standard.array(forKey: markKey) // получаем массивы по полям
        let models = UserDefaults.standard.array(forKey: modelKey)
        let powers = UserDefaults.standard.array(forKey: powerKey)
        let years = UserDefaults.standard.array(forKey: yearKey)
        let wheelDrives = UserDefaults.standard.array(forKey: wheelDriveKey)
        let types = UserDefaults.standard.array(forKey: typeKey)
        let amount = UserDefaults.standard.integer(forKey: amountKey)
        
        for i in 0..<amount { // собираем автомобили из массивов
            let car = Car(mark: marks?[i] as! String,
                          model: models?[i] as! String,
                          year: years?[i] as! Int,
                          power: powers?[i] as! Int,
                          wheelDrive: wheelDrives?[i] as! String,
                          type: types?[i] as! String)
            cars.append(car)
        }
        return cars // возвращаем итоговый массив
    }
    
    static func deleteAll(){
        UserDefaults.standard.set(nil, forKey: markKey)
        UserDefaults.standard.set(nil, forKey: amountKey)
    }
}

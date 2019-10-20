//
//  MyTableViewController.swift
//  cars
//
//  Created by Анна Арзуманян on 20/10/2019.
//  Copyright © 2019 Анна Арзуманян. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {

    var cars : [Car] = [] // массив автомобилей для отображения в таблице
    var carAdded = false // признак добавления нового авто
    var newCar: Car? // само новое авто, которое необходимо добавить в массив cars в момент перехода со страницы добавления
    
    override func viewDidLoad() { // метод, срабатывающий при появлении VC в первый раз
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem // задаем кнопку редактирования
        
        navigationItem.rightBarButtonItem?.title = tableView.isEditing ? "Готово" : "Править" //выставляем для кнопки редактирования название
        if CarData.getCars().count == 0 { //проверяем, есть ли у нас в памяти автомобили, если ни одного, то создаем три
            let car1 = Car(mark: "Lexus", model: "IS 300", year: 2007, power: 249, wheelDrive: "Задний", type: "Седан")
            let car2 = Car(mark: "Lexus", model: "IS 300", year: 2007, power: 249, wheelDrive: "Задний", type: "Седан")
            let car3 = Car(mark: "Lexus", model: "IS 300", year: 2007, power: 249, wheelDrive: "Задний", type: "Седан")
            cars.append(car1)
            cars.append(car2)
            cars.append(car3)
            CarData.saveCars(cars: cars)
        } else {
            cars = CarData.getCars() // а если есть в памяти, то отображаем их
        }
        tableView.reloadData() // перезагружаем таблицу
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    override func viewWillAppear(_ animated: Bool) { // метод срабатывающий при каждом появлении VC
        if carAdded{ // проверяем, что мы пришли сюда со страницы добавления авто
            cars.append(newCar!) //если да, то добавляем автомобиль
            carAdded = false
//            newCar = nil
            self.tableView.reloadData() // перезагружаем таблицу
        }
        CarData.saveCars(cars: cars) // сохраняем новый список автомобилей
    }
    // MARK: - Table view data source


   
    @IBAction func addCarButtonPressed(_ sender: Any) { // метод, который открывает нам страницу добавления нового авто
        let addCarVC = storyboard?.instantiateViewController(withIdentifier: "addCarVC") as! AddCarViewController // создаем экран добавления
        addCarVC.parentVC = self // задаем ему родительский контроллер, в который он передаст данные
        addCarVC.modalPresentationStyle = .fullScreen // устанавливаем тип перехода
        present(addCarVC, animated: true, completion: nil) // отображаем созданный нами экран
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1 // возвращаем количество секций в таблице
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cars.count // возвращаем количество строк в таблице
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "car", for: indexPath) as! MyTableViewCell // создаем ячейку нашего класса для строки с индексом indexPath.row

        // Configure the cell...
        cell.setup(car: cars[indexPath.row]) // настраиваем ячейку
        return cell // в продакшн
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100  // задаем высоту ячейки
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true // определяем, можно ли редактировать нашу ячейку
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete { // определяем, что мы пытаемся удалить ячейку
            // Delete the row from the data source
            cars.remove(at: indexPath.row) // удаляем её из массива
            tableView.deleteRows(at: [indexPath], with: .fade) // удаляем её из таблицы
            CarData.saveCars(cars: cars) // сохраняем изменения в память
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

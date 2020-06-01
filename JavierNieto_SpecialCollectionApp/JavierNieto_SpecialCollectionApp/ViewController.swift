//
//  ViewController.swift
//  JavierNieto_SpecialCollectionApp
//
//  Created by X on 5/31/20.
//  Copyright © 2020 X. All rights reserved.
//  M04 Assignment: Special Collection App
//  1) At least three groups with headers
//  2) Customized cells with images
//  3) An index sorting the data by topic or name

import UIKit
// 2 dimensional arrays of cars for names and logos. IndexArray id used
    let cellID = "cellID"
    let cars2Array = [["Extreme","Bentley","Lamborghini","Ferrari","Rolls Royce"],
                      ["Luxury","Aston Martin","Jaguar","Mercedes","Porsche"],
                      ["Regular","Buick","Cadillac","Chevrolet","Dodge","Ford","Honda","Mazda","Nissan","Toyota","Volkswagen"],
                      ["Sport","Acura","Alfa Romeo","Audi","Bmw"]]
    let indexArray = ["Extreme","Luxury","Regular","Sport"]
    let image2Array = [["Extreme","bentley-Logo","lamborghini-Logo","ferrari-Logo","rollsRoyce-Logo"],
                       ["Luxury","aston-martin-Logo","jaguar-logo","mb-Logo","porsche-Logo"],
                       ["Regular","buick-Logo","cadillac-Logo","chevrolet-Logo","dodge-Logo","ford-Logo","honda-LogoRed","mazda-Logo","nissan-Logo","toyota-Logo","volkswagen-Logo"],
                       ["Sport","acura-Logo","alfa_romeo-Logo","audi-Logo","bmw-Logo"]]
//Main function
class ViewController: UIViewController {
    @IBOutlet weak var carTable: UITableView! // Car TableView outlet
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        carTable.dataSource = self
        carTable.delegate = self
        carTable.sectionIndexColor = UIColor.yellow
        carTable.sectionIndexBackgroundColor = UIColor.red
        carTable.sectionIndexTrackingBackgroundColor = UIColor.darkGray
        }
}
// Extended ViewController
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = carTable.dequeueReusableCell(withIdentifier: cellID)
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = cars2Array[indexPath.section][indexPath.row + 1]
        cell?.imageView?.image = UIImage(named: image2Array[indexPath.section][indexPath.row + 1])
        return cell!
    }
    
    // Give the nuber of rows per category of cars
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars2Array[section].count-1
    }
    // Gives the count to creat sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return cars2Array.count
    }
    
  // Takes the first  element of the 2D car array to give titles
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return cars2Array[section][0]
    }
 //This for creating the Sections or types of cars
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return indexArray
    }
// Displays a pop up when you click on one of the items in the table view.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = cars2Array[indexPath.section][indexPath.row + 1]
    let alert = UIAlertController(title: "Your Choice", message: "\(selectedItem)", preferredStyle:
    .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler:{action->Void in}); alert.addAction(okAction)
    self.present(alert, animated: true, completion: nil)
    }
}

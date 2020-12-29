//
//  OldTableViewController.swift
//  iOS-Scrollview
//
//  Created by Supawit Ruen on 18/12/2563 BE.
//

import UIKit

struct Animal {
    var name: String
    var description: String
}

class OldTableViewController: UIViewController {

    @IBOutlet weak var oldTableView: UITableView!
    var animals: [Animal] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        oldTableView.dataSource = self
        oldTableView.delegate = self
        oldTableView.register(UINib(nibName: CustomTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CustomTableViewCell.identifier)
        
        animals.append(Animal(name: "Ant", description: "the smallest animal"))
        animals.append(Animal(name: "Bee", description: "the sweet animal"))
        animals.append(Animal(name: "Cat", description: "the cute animal"))
    }

}

extension OldTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as! CustomTableViewCell
        cell.delegate = self
        cell.titleLabel.text = animals[indexPath.row].name
        cell.descriptionLabel.text = animals[indexPath.row].description
        cell.selectedAnimal = animals[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index: " + String(indexPath.row))
    }
}

extension OldTableViewController: CustomTableViewCellDelegate {
    func sendSelectedAnimal(_ animal: Animal) {
        print(animal.name + " readmore!!")
    }
//    func sendSelectedAnimal(_ animal: Animal) {
//        print(animal.name + " readmore")
//    }
}

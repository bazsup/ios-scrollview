//
//  CustomTableViewController.swift
//  iOS-Scrollview
//
//  Created by Supawit Ruen on 18/12/2563 BE.
//

import UIKit

class CustomTableViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    private var list = ["bbbbb", "", "wow"]
    private var dataSource: UITableViewDiffableDataSource<String, String>!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.register(UINib(nibName: CustomTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CustomTableViewCell.identifier)
//        tableview.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        
//        Cell creation
        dataSource = MyCustomTableViewDataSource(tableView: tableview) {
            (tableview, IndexPath, item) -> UITableViewCell? in
//            let cell = tableview.dequeueReusableCell(withIdentifier: "defaultCell")
            
            guard let cell = tableview.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: IndexPath) as? CustomTableViewCell else {
                return UITableViewCell()
            }
            cell.thumbnailImage.image = UIImage(named: "luck")
            cell.titleLabel?.text = item
            return cell
        }
        tableview.dataSource = dataSource
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        var snapShot = NSDiffableDataSourceSnapshot<String, String>()
        snapShot.appendSections(["section  1"])
        snapShot.appendItems(list)
        dataSource.apply(snapShot)
    }
}

final class MyCustomTableViewDataSource: UITableViewDiffableDataSource<String, String> {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return snapshot().sectionIdentifiers[section]
    }
}

struct CustomList {
    var image: String
    var title: String
    var label: String
}

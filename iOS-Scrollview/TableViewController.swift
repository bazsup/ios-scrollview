//
//  TableViewController.swift
//  iOS-Scrollview
//
//  Created by Supawit Ruen on 18/12/2563 BE.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    private var list = ["bbbbb", "", "asd"]
    private var dataSource: UITableViewDiffableDataSource<String, String>!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
        
//        Cell creation
//        dataSource =
        dataSource = MyTableViewDataSource(tableView: tableview) {
            (tableview, IndexPath, item) -> UITableViewCell? in
            let cell = tableview.dequeueReusableCell(withIdentifier: "defaultCell")
            cell?.textLabel?.text = item
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

final class MyTableViewDataSource: UITableViewDiffableDataSource<String, String> {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return snapshot().sectionIdentifiers[section]
    }
}

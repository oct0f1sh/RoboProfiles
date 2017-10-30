//
//  ViewController.swift
//  AppBundleReader
//
//  Created by Eliel A. Gordon on 10/26/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var robots: [Robot] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        let path = Bundle.main.path(forResource: "robo-profiles", ofType: ".json")
        if let path = path {
            let decoder = JSONDecoder()
            let url = URL(fileURLWithPath: path)
            
            let data = try! Data.init(contentsOf: url)
            
            self.robots = try! decoder.decode([Robot].self, from: data)
        } else {
            print("nope")
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return robots.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let robot = robots[indexPath.row]
        let cell: TableCell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! TableCell
        cell.personalityLabel.text = robot.personality
        cell.nameLabel.text = robot.name
        cell.phraseLabel.text = robot.phrase
        return cell
    }
}

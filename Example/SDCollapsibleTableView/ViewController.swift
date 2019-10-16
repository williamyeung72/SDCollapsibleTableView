//
//  ViewController.swift
//  SDCollapsibleTableView
//
//  Created by William Yeung on 10/14/2019.
//  Copyright (c) 2019 William Yeung. All rights reserved.
//

import UIKit
import SDCollapsibleTableView

class ViewController: UIViewController {
    
    var dataArray = [[String]]()
    
    let tableView:SDTableView = {
        let tableView = SDTableView(frame: CGRect.zero, style: UITableViewStyle.plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArray = [
            ["A", "B", "C", "D"],
            ["A", "B", "C", "D"],
            ["A", "B", "C", "D"],
            ["A", "B", "C", "D"],
            ["A", "B", "C", "D"],
            ["A", "B", "C", "D"],
            ["A", "B", "C", "D"],
        ]
        
        tableView.sdDelegate = self
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: SDTableViewDelegate {
    
    func sdTableView(_ sdTableView: SDTableView, didSelectRowAt indexPath: IndexPath) {
        sdTableView.handleExpandCollapse(section: indexPath.section)
    }
    
    func numberOfSections(in sdTableView: SDTableView) -> Int {
        return dataArray.count
    }
    
    func sdTableView(_ sdTableView: SDTableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray[section].count
    }
    
    func sdTableView(_ sdTableView: SDTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sdTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let myLabel = cell.textLabel {
            myLabel.text = "\(dataArray[indexPath.section][indexPath.row])"
        }
        return cell
    }
    
    func sdTableView(_ sdTableView: SDTableView, titleForHeaderInSection section: Int) -> String? {
        return "Section"
    }
    
    func sdTableView(_ sdTableView: SDTableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func sdTableView(_ sdTableView: SDTableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = TableHeaderView()
        view.backgroundColor = .systemGray
        view.titleLabel.text = "Section \(section)"
        view.sectionIndex = section
        view.delegate = self
        
        return view
    }
}

extension ViewController: TableHeaderViewDelegate {
    func buttonDidPress(_ sectionIndex: Int) {
        tableView.handleExpandCollapse(section: sectionIndex)
    }
    
}

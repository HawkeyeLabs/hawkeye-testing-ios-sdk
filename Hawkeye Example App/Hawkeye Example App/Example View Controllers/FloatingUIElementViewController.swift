//
//  FloatingUIElementViewController.swift
//  Testing SDK Example
//
//  Created by Matt Moss on 11/6/19.
//  Copyright © 2019 Hawkeye Labs, Inc. All rights reserved.
//

import UIKit

class FloatingUIElementViewController: UIViewController {
    
    var tableView: UITableView!
    var items = ["Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test"]
    
    var floatingButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Config view
        title = "Floating UI Example"
        view.backgroundColor = UIColor.white
        
        // Configure table view
        tableView = UITableView(frame: view.frame)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.scrollIndicatorInsets = tableView.contentInset
        view.addSubview(tableView)
        
        floatingButton = UIButton(frame: CGRect(x: 20, y: view.bounds.height - 100, width: view.bounds.width - 40, height: 58))
        floatingButton.backgroundColor = UIColor(red: 14 / 255.0, green: 122 / 255.0, blue: 254 / 255.0, alpha: 1.0)
        floatingButton.layer.cornerRadius = floatingButton.bounds.midY
        floatingButton.setTitle("Example Button", for: .normal)
        floatingButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        view.addSubview(floatingButton)
    }

}

extension FloatingUIElementViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = "\(items[indexPath.row]) (\(indexPath.section),\(indexPath.row))"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(TableViewController(), animated: true)
    }
}

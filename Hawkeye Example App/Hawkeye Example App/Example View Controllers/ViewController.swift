//
//  ViewController.swift
//  Testing SDK Example
//
//  Created by Matt Moss on 4/28/19.
//  Copyright © 2019 Hawkeye Labs, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView!
    var items = ["Scroll View", "Table View", "Collection View", "Horizontal Scrolling", "Floating UI Elements", "Popups", "Present View Controller"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure view
        view.backgroundColor = UIColor.white
        navigationItem.title = "Hawkeye SDK Samples"
        
        // Configure table view
        tableView = UITableView(frame: view.frame)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        view.addSubview(tableView)
        
        // Add cancel button if needed
        if presentingViewController != nil {
            let cancelBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(cancelSelected(_:)))
            navigationItem.leftBarButtonItem = cancelBarButtonItem
        }
    }
    
    @objc func cancelSelected(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.imageView?.backgroundColor = UIColor.green
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            navigationController?.pushViewController(ScrollViewController(), animated: true)
        } else if indexPath.row == 1 {
            navigationController?.pushViewController(TableViewController(), animated: true)
        } else if indexPath.row == 2 {
            navigationController?.pushViewController(CollectionViewController(), animated: true)
        } else if indexPath.row == 3 {
            navigationController?.pushViewController(HorizontalScrollingViewController(), animated: true)
        } else if indexPath.row == 4 {
            navigationController?.pushViewController(FloatingUIElementViewController(), animated: true)
        } else if indexPath.row == 5 {
            navigationController?.pushViewController(PopupViewController(), animated: true)
        } else if indexPath.row == 6 {
            let navCon = UINavigationController(rootViewController: ViewController())
            present(navCon, animated: true, completion: nil)
        }
    }
}

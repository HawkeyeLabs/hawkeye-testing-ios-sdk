//
//  TableViewViewController.swift
//  Testing SDK Example
//
//  Created by Matt Moss on 11/6/19.
//  Copyright © 2019 Hawkeye Labs, Inc. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    var tableView: UITableView!
    var items = ["Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test"]
    
    var toolbar: UIToolbar!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Config view
        title = "Table View Example"
        view.backgroundColor = UIColor.white
        
        // Configure table view
        tableView = UITableView(frame: view.frame)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        view.addSubview(tableView)
        
        // Add toolbar
        toolbar = UIToolbar()
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toolbar)
        
        NSLayoutConstraint.activate([
            toolbar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            toolbar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            toolbar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            toolbar.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        let flexibleSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let testBarButton = UIBarButtonItem(title: "Test", style: .plain, target: nil, action: nil)
        let workingBarButton = UIBarButtonItem(title: "Working", style: .plain, target: nil, action: nil)
        let coolBarButton = UIBarButtonItem(title: "Cool", style: .plain, target: nil, action: nil)
        let niceBarButtonItem = UIBarButtonItem(title: "Nice", style: .plain, target: nil, action: nil)
        toolbar.items = [testBarButton, flexibleSpace, workingBarButton, flexibleSpace, coolBarButton, flexibleSpace, niceBarButtonItem]
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.contentInset.bottom = toolbar.bounds.height
        tableView.scrollIndicatorInsets = tableView.contentInset
    }

}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
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

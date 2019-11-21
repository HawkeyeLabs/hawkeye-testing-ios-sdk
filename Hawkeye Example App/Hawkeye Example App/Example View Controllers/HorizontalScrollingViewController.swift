//
//  HorizontalScrollingViewController.swift
//  Testing SDK Example
//
//  Created by Matt Moss on 11/6/19.
//  Copyright © 2019 Hawkeye Labs, Inc. All rights reserved.
//

import UIKit

class HorizontalScrollingViewController: UIViewController {
    
    var tableView: UITableView!
    var items = ["Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test", "Test"]
    
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Config view
        title = "Horizontal Scrolling Example"
        view.backgroundColor = UIColor.white
        
        // Configure table view
        tableView = UITableView(frame: view.frame)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        view.addSubview(tableView)
        
        // Add collection view
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 70, height: 70)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        let collectionHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 90))
        tableView.tableHeaderView = collectionHeaderView
        
        let collectionSeparator = UIView(frame: CGRect(x: 0, y: collectionHeaderView.frame.maxY - 0.5, width: collectionHeaderView.bounds.width, height: 0.5))
        collectionSeparator.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        collectionHeaderView.addSubview(collectionSeparator)
        
        collectionView = UICollectionView(frame: collectionHeaderView.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HorizontalScrollExampleCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionHeaderView.addSubview(collectionView)
        
    }

}

extension HorizontalScrollingViewController: UITableViewDelegate, UITableViewDataSource {
    
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

extension HorizontalScrollingViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - UICollectionViewDataSource, UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let basicCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        guard let cell = basicCell as? HorizontalScrollExampleCell else { return basicCell }
        cell.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        cell.layer.cornerRadius = cell.bounds.midY
        cell.label.text = "\(indexPath.row)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

//
//  CollectionViewController.swift
//  Testing SDK Example
//
//  Created by Matt Moss on 11/6/19.
//  Copyright © 2019 Hawkeye Labs, Inc. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var items = ["Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool", "Cool"]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Collection View Example"
        view.backgroundColor = UIColor.white
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.minimumLineSpacing = 20
        collectionViewLayout.minimumInteritemSpacing = 20
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.itemSize = CGSize(width: 90, height: 90)
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionViewLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.backgroundColor = UIColor.clear
        view.addSubview(collectionView)
    }
    
}

extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - UICollectionViewDataSource, UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        cell.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

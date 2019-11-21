//
//  HorizontalScrollExampleCell.swift
//  Testing SDK Example
//
//  Created by Matt Moss on 11/8/19.
//  Copyright © 2019 Hawkeye Labs, Inc. All rights reserved.
//

import UIKit

class HorizontalScrollExampleCell: UICollectionViewCell {
    
    // MARK: - Variables
    
    internal var label: UILabel!
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.black.withAlphaComponent(0.2)
        layer.cornerRadius = bounds.midY
        
        label = UILabel(frame: bounds)
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.textAlignment = .center
        addSubview(label)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

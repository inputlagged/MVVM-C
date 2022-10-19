//
//  BaseUICollectionViewCell.swift
//  mvvmFlowCoordinator
//
//  Created by inputlagged on 10/17/22.
//

import UIKit

internal class BaseUICollectionViewCell: UICollectionViewCell {
   
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        setupShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func setupShadow() {
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.cornerRadius = 6
        contentView.layer.masksToBounds = true
        
        layer.shadowRadius = 6
        layer.shadowOpacity = 0.4
        layer.shadowColor = UIColor.black.cgColor
        
        layer.shadowOffset = CGSize(width: 0, height: 5)
//        layer.cornerRadius = 6
    }
    
}

//
//  CatListView.swift
//  mvvmFlowCoordinator
//
//  Created by inputlagged on 10/19/22.
//

import UIKit
import SnapKit

internal final class CatListView: BaseView {
    internal lazy var catsCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.estimatedItemSize = .zero
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CatCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()

    internal lazy var acitvityIndicator: UIActivityIndicatorView = {
        let indicitorView = UIActivityIndicatorView(style: .gray)
        return indicitorView
    }()

    internal override func onSetupConstraints() {
        super.onSetupConstraints()
        
        catsCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-16)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            $0.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(16)
        }
        
        acitvityIndicator.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    internal override func onAddSubviews() {
        super.onAddSubviews()
        addSubview(catsCollectionView)
        addSubview(acitvityIndicator)
    }
    
    internal override func onSetupTargets() {
        acitvityIndicator.startAnimating()
    }
}



    

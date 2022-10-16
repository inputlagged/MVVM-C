//
//  CatCollectionViewCell.swift
//  mvvmFlowCoordinator
//
//  Created by inputlagged on 10/16/22.
//

import UIKit
import SnapKit

internal final class CatCollectionViewCell: UICollectionViewCell {
    private let catImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let catNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }
    
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func setup(with viewModel: Breed) {
        catImageView.image = UIImage(named: "example")
    }
    
    private func setupView() {
        [catImageView, catNameLabel].forEach { contentView.addSubview($0) }
    }
    
    private func setupConstraints() {
        catImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

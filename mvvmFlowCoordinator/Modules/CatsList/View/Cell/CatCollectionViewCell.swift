//
//  CatCollectionViewCell.swift
//  mvvmFlowCoordinator
//
//  Created by inputlagged on 10/16/22.
//

import UIKit
import SnapKit

internal final class CatCollectionViewCell: BaseUICollectionViewCell {
    private let catImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
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
    
    internal override func prepareForReuse() {
        super.prepareForReuse()
        self.catImageView.image = nil
    }
    
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func setup(with cat: Breed) {
        let image = UIImage(named: "catPlaceholder")
        if cat.image != nil {
            catImageView.setImage(cat.image!, catID: cat.name!)
        } else {
            catImageView.image = image
        }
//        if let image = cat.image {
//            catImageView.setImage(cat.image!, catID: cat.name!)
//        }
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

//
//  CharacterDetailViewController.swift
//  mvvmFlowCoordinator
//
//  Created by inputlagged on 10/13/22.
//

import Foundation
import UIKit

internal final class CatDetailViewController: UIViewController {
    
    private var viewModel: CatDetailViewModelProtocol
    
    private lazy var catImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.borderWidth = 5
        imageView.layer.cornerRadius = view.frame.width / 4
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var catInfoTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
//        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    // MARK: - Init
    
    internal init(viewModel: CatDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = viewModel.breed.name
        addSubviews()
        setupConstraints()
        setupLabels()
    }
    
    private func addSubviews() {
        view.addSubview(catImageView)
        view.addSubview(catInfoTableView)
    }
    
    private func setupConstraints() {
        catImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(view.frame.width / 2)
            $0.width.equalTo(view.frame.width / 2)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(8)
        }
        
        catInfoTableView.snp.makeConstraints {
            $0.top.equalTo(catImageView.snp.bottom).offset(16)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setupLabels() {
        let selectedBreed = viewModel.breed
        if let image = selectedBreed.image {
            catImageView.setImage(image, catID: selectedBreed.name!)
        }
    }
}

extension CatDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}


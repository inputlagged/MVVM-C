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
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var temperamentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var catInfoTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
//        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "catInfoCell")
//        tableView.dataSource = self
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
        view.addSubview(temperamentLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(catInfoTableView)
    }
    
    private func setupConstraints() {
        catImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(view.frame.width / 2)
            $0.width.equalTo(view.frame.width / 2)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(8)
        }
        
        temperamentLabel.snp.makeConstraints {
            $0.top.equalTo(catImageView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(temperamentLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
        }
    }
    
    private func setupLabels() {
        let selectedBreed = viewModel.breed
        if let image = selectedBreed.image {
            catImageView.setImage(image, catID: selectedBreed.name!)
        }
        temperamentLabel.text = selectedBreed.temperament
        descriptionLabel.text = selectedBreed.description
    }
}

// TODO: Display characteristic

//extension CatDetailViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "catInfoCell", for: indexPath)
//        let breed = viewModel.breed
//
//        switch indexPath.row {
//        case 0:
//            cell.textLabel?.text = breed.temperament
//        case 1:
//            cell.textLabel?.text = breed.description
//        default:
//            break
//        }
//
//        return cell
//    }
//}
//

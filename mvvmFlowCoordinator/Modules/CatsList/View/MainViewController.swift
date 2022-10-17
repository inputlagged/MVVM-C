//
//  FistViewController.swift
//  mvvmFlowCoordinator
//
//  Created by inputlagged on 10/11/22.
//

import UIKit
import SnapKit


internal final class MainViewController: UIViewController {
    
    internal var viewModel: MainViewModelProtocol!

    private lazy var catsCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CatCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .lightGray
        return collectionView
    }()
    
    private let acitvityIndicator: UIActivityIndicatorView = {
        let indicitorView = UIActivityIndicatorView(style: .gray)
        return indicitorView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel.title
        addSubviews()
        setupConstraints()
        setupBindables()
        showActivityIndicator()
        viewModel.fetchBreeds()
    }
    
    private func addSubviews() {
        view.addSubview(catsCollectionView)
        view.addSubview(acitvityIndicator)
    }
    
    private func setupConstraints() {
        catsCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
        }
        
        acitvityIndicator.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    private func setupBindables() {
        viewModel.reload = { [weak self] in
            DispatchQueue.main.async {
                self?.catsCollectionView.reloadData()
                self?.acitvityIndicator.stopAnimating()
            }
        }
    }
    
    private func showActivityIndicator() {
        acitvityIndicator.startAnimating()
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.5, height: collectionView.frame.width / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.viewModelForSelectedRow(at: indexPath)
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.breeds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CatCollectionViewCell
        cell.setup(with: viewModel.breeds[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

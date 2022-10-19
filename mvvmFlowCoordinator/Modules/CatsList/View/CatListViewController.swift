//
//  FistViewController.swift
//  mvvmFlowCoordinator
//
//  Created by inputlagged on 10/11/22.
//

import UIKit
import SnapKit


internal final class CatListViewController: BaseViewController<CatListView> {
    
    internal var viewModel: CatListViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.catsCollectionView.delegate = self
        rootView.catsCollectionView.dataSource = self
        
        title = viewModel.title
        
        setupBindables()
//        showActivityIndicator()
        viewModel.fetchBreeds()
    }
    
    private func setupBindables() {
        viewModel.reload = { [weak self] in
            DispatchQueue.main.async {
                self?.rootView.catsCollectionView.reloadData()
                self?.rootView.acitvityIndicator.stopAnimating()
            }
        }
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension CatListViewController: UICollectionViewDelegateFlowLayout {
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

// MARK: UICollectionViewDataSource

extension CatListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.breeds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CatCollectionViewCell
        if indexPath.row == viewModel.breeds.count - 1, viewModel.breeds.count < 47 {
            viewModel.fetchBreeds()
        }
        cell.setup(with: viewModel.breeds[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

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
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
//        let tableView = UITableView(frame: .zero, style: .insetGrouped)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.dataSource = self
//        tableView.delegate = self
//        return tableView
    }()
    
    private let acitvityIndicator: UIActivityIndicatorView = {
        let indicitorView = UIActivityIndicatorView(style: .gray)
        return indicitorView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cell = UICollectionViewCell()
//        cell.reuseIdentifier = "someid"
        catsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "someid")
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
            $0.edges.equalToSuperview()
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
 
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.breeds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "someid", for: indexPath)
        cell.backgroundColor = .red
//        let cell = UICollectionViewCell()
//        let view = UIView()
//        view.backgroundColor = .red
//        cell.backgroundView =
        return cell
    }
}
//extension MainViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        viewModel.viewModelForSelectedRow(at: indexPath)
//    }
//}
//
//extension MainViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        viewModel.breeds.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
//        if indexPath.row == viewModel.breeds.count - 1 {
//            viewModel.fetchBreeds()
//        }
//        let breed = viewModel.breeds[indexPath.row]
//        cell.textLabel?.text = breed.name
//        return cell
//    }
//}

//#if DEBUG
//import SwiftUI
//
//struct InfoVCRepresentable: UIViewControllerRepresentable {
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//        // leave this empty
//    }
//
//    @available(iOS 13.0.0, *)
//    func makeUIViewController(context: Context) -> UIViewController {
//        MainViewController()
//    }
//}
//
//@available(iOS 13.0, *)
//struct InfoVCPreview: PreviewProvider {
//    static var previews: some View {
//       InfoVCRepresentable()
//    }
//}
//#endif

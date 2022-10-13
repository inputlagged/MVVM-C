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

    private lazy var charactersTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
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
        viewModel.fetchCharacters()
    }
    
    private func addSubviews() {
        view.addSubview(charactersTableView)
        view.addSubview(acitvityIndicator)
    }
    
    private func setupConstraints() {
        charactersTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        acitvityIndicator.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    private func setupBindables() {
        viewModel.reload = { [weak self] in
            DispatchQueue.main.async {
                self?.charactersTableView.reloadData()
                self?.acitvityIndicator.stopAnimating()
            }
        }
    }
    
    private func showActivityIndicator() {
        acitvityIndicator.startAnimating()
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.viewModelForSelectedRow(at: indexPath)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        if indexPath.row == viewModel.characters.count - 1 {
            viewModel.fetchCharacters()
        }
        let character = viewModel.characters[indexPath.row]
        cell.textLabel?.text = character.name
        return cell
    }
}

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

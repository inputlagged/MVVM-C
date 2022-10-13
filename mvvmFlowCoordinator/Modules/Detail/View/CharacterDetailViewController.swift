//
//  CharacterDetailViewController.swift
//  mvvmFlowCoordinator
//
//  Created by inputlagged on 10/13/22.
//

import Foundation
import UIKit

internal final class CharacterDetailViewController: UIViewController {
    
    private var viewModel: CharacterDetailViewModelProtocol
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var heightLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var massLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    
    internal init(viewModel: CharacterDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setupLabels()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(nameLabel)
        view.addSubview(heightLabel)
        view.addSubview(massLabel)
        view.addSubview(genderLabel)
    }
    
    private func setupConstraints() {
        nameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-40)
        }
        
        heightLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        massLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(40)
        }
        
        genderLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(80)
        }
    }
    
    private func setupLabels() {
        let selectedCharacter = viewModel.character
        nameLabel.text = "Name: \(selectedCharacter.name)"
        heightLabel.text = "Height: \(selectedCharacter.height)"
        massLabel.text = "Mass: \(selectedCharacter.mass)"
        genderLabel.text = "Gender: \(selectedCharacter.gender)"
    }
}

#if DEBUG
import SwiftUI

struct InfoVCRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // leave this empty
    }

    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        CharacterDetailViewController(viewModel: CharacterDetailViewModel(character: Character(name: "John doe", height: "1337", mass: "228", gender: "Unhuman")))
    }
}

@available(iOS 13.0, *)
struct InfoVCPreview: PreviewProvider {
    static var previews: some View {
       InfoVCRepresentable()
    }
}
#endif

//
//  BaseView.swift
//  mvvmFlowCoordinator
//
//  Created by inputlagged on 10/19/22.
//

import UIKit

internal class BaseView: UIView {
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        onAddSubviews()
        onSetupConstraints()
        onSetupTargets()
    }
    
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func onSetupTargets() {}
    
    internal func onSetupConstraints() {}
    
    internal func onAddSubviews() {}
}

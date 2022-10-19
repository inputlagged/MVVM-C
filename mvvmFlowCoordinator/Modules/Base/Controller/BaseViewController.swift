//
//  BaseViewController.swift
//  mvvmFlowCoordinator
//
//  Created by inputlagged on 10/19/22.
//

import UIKit

internal class BaseViewController<View: UIView>: UIViewController {
    internal var rootView: View {
        view as! View
    }
    
    override func loadView() {
        view = View()
        
        configureController()
        configureViewModel()
        configureActions()
    }
    
    internal func configureController() {}
    
    internal func configureViewModel() {}
    
    internal func configureActions() {}
}

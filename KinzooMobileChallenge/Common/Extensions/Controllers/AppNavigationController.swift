//
//  AppNavigationController.swift
//  KinzooMobileChallenge
//
//  Created by Waqas Naseem on 14/10/2023.
//

import DesignSystem
import UIKit

class AppNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
            
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    // MARK: - Private Methods
    private func configureUI() {
        navigationBar.tintColor = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.black,
             NSAttributedString.Key.font: UIFont(.avenirDemiBold, size: .standard(.h3))]
    }
}

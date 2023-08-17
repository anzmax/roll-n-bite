//
//  ViewController.swift
//  Roll-n-Bite
//
//  Created by Malini Ka on 10.08.2023.
//

import UIKit
import SnapKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        showMainScreen()
        
    }
    
    func setupViews() {
        view.backgroundColor = .systemYellow
    }

    func setupConstraints() {
        
    }
    
    func showMainScreen() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let mainVC = MainScreenViewController()
            UIWindow.key.rootViewController = mainVC
        }
    }
}


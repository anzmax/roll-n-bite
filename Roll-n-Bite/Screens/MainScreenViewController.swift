//
//  MainScreenViewController.swift
//  Roll-n-Bite
//
//  Created by Malini Ka on 10.08.2023.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    //MARK: - UI
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    let profileVC: ProfileViewController = {
        let controller = ProfileViewController()
        controller.view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        controller.view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        return controller
    }()
    
    let coinStoreVC: CoinStoreViewController = {
        let controller = CoinStoreViewController()
        controller.view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        controller.view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        return controller
    }()
    
    let menuVC: MenuViewController = {
        let controller = MenuViewController()
        controller.view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        controller.view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        return controller
    }()
    
    lazy var controllers: [UIViewController] = [profileVC, menuVC, coinStoreVC]
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupControllers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.scrollTo(horizontalPage: 1)
    }
    
    func setupViews() {
        view.backgroundColor = .green
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
    }
    
    func setupControllers() {
        for controller in controllers {
            stackView.addArrangedSubview(controller.view)
        }
    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
        }
    }
}

//
//  MainTabBarViewController.swift
//  InfinityTableViewScroll
//
//  Created by Agatay Embeev on 20.02.2023.
//

import UIKit

final class MainTabBarViewController: UITabBarController {
    
    // MARK: - Lifecycle:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupNavigation()
    }
    
    // MARK: - Methods:
    
    private func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Infinity scroll"
        navigationController?.navigationBar.sizeToFit()
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateViewControllers(TopViewController(),
                                    title: "Top",
                                    image: UIImage(systemName: "house")),
            generateViewControllers(AskViewController(),
                                    title: "Ask",
                                    image: UIImage(systemName: "questionmark")),
            generateViewControllers(JobViewController(),
                                    title: "Job",
                                    image: UIImage(systemName: "doc")),
            generateViewControllers(ShowViewController(),
                                    title: "Show",
                                    image: UIImage(systemName: "briefcase")),
        ]
        
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().barTintColor = .clear
    }
    
    private func generateViewControllers(_ viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        
        return viewController
    }
}

//
//  MainTabBarViewController.swift
//  InfinityTableViewScroll
//
//  Created by Agatay Embeev on 20.02.2023.
//

import UIKit

final class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
    }
    
    // MARK: - Methods:
    
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
        
        view.backgroundColor = .systemBackground
        tabBar.tintColor = .label
    }
    
    private func generateViewControllers(_ viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        
        return viewController
    }
}

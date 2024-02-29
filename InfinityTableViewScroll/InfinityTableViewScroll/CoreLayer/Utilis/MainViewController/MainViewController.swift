//
//  MainViewController.swift
//  InfinityTableViewScroll
//
//  Created by Agatai Embeev on 29.02.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    deinit {
        print("View Controller \(self) deinited")
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) is not available")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

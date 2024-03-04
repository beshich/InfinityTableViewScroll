//
//  TopViewController.swift
//  InfinityTableViewScroll
//
//  Created by Agatay Embeev on 20.02.2023.
//

import UIKit

final class TopViewController: MainListViewController {
    
    // MARK: - Properties:
    
    var viewModel: TopViewModel
    
    // MARK: - Lifecycle:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    
    init(viewModel: TopViewModel) {
        self.viewModel = viewModel
        super.init(viewModel: viewModel)
    }
    
    override func setupBindings() {
        super.setupBindings()
    }
    
    override func updateDisplayData() {
        viewModel.didUpdateDisplayData()
    }
}

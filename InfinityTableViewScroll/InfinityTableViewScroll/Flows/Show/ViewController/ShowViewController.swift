//
//  ShowViewController.swift
//  InfinityTableViewScroll
//
//  Created by Agatay Embeev on 20.02.2023.
//

import UIKit

final class ShowViewController: MainListViewController {
    
    // MARK: - Properties:
    
    var viewModel: ShowViewModel
    
    // MARK: - Lifecycle:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    
    init(viewModel: ShowViewModel) {
        self.viewModel = viewModel
        super.init(viewModel: viewModel, cellIdentifier: "Show", reusableCell: UITableViewCell())
    }
    
    override func setupBindings() {
        super.setupBindings()
    }
    
    override func updateDisplayData() {
        viewModel.didUpdateDisplayData()
    }
}

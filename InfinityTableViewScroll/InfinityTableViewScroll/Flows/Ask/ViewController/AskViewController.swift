//
//  AskViewController.swift
//  InfinityTableViewScroll
//
//  Created by Agatay Embeev on 20.02.2023.
//

import UIKit

final class AskViewController: MainListViewController {
    
    // MARK: - Properties:
    
    var viewModel: AskViewModel
    
    // MARK: - Lifecycle:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    
    init(viewModel: AskViewModel) {
        self.viewModel = viewModel
        super.init(viewModel: viewModel, cellIdentifier: "Ask", reusableCell: UITableViewCell())
    }
    
    override func setupBindings() {
        super.setupBindings()
    }
    
    override func updateDisplayData() {
        viewModel.didUpdateDisplayData()
    }
}

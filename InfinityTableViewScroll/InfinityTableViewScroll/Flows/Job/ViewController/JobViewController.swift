//
//  JobViewController.swift
//  InfinityTableViewScroll
//
//  Created by Agatay Embeev on 20.02.2023.
//

import UIKit

final class JobViewController: MainListViewController {
    
    // MARK: - Properties:
    
    var viewModel: JobViewModel
    
    // MARK: - Lifecycle:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    
    init(viewModel: JobViewModel) {
        self.viewModel = viewModel
        super.init(viewModel: viewModel, cellIdentifier: "Job", reusableCell: UITableViewCell())
    }
    
    override func setupBindings() {
        super.setupBindings()
    }
    
    override func updateDisplayData() {
        viewModel.didUpdateDisplayData()
    }
}

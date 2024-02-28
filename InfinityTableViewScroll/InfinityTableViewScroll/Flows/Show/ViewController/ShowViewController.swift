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
        setupBindings()
    }
    
    init(viewModel: ShowViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

private extension ShowViewController {
    
    func updateDisplayData() {
        viewModel.updateDisplayData()
    }
    
    func setupBindings() {
        viewModel.didUpdateSection = { [weak self] isUpdate in
            if isUpdate {
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }
}

// MARK: - TableViewDelegate/DataSource:

extension ShowViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.displayStories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        reusableCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        reusableText = viewModel.displayStories[indexPath.row].title
        
        return reusableCell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (!viewModel.isAllDataDisplayed && indexPath.row >= viewModel.lastItemIndex && viewModel.isUpdating) {
            updateDisplayData()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = viewModel.displayStories[indexPath.row].url else { return }
        
        let viewModel = DetailsViewModel(url: url)
        let viewController = DetailsViewController(viewModel: viewModel)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

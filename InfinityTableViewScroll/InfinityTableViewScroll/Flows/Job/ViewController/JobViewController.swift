//
//  JobViewController.swift
//  InfinityTableViewScroll
//
//  Created by Agatay Embeev on 20.02.2023.
//

import UIKit

final class JobViewController: TableViewController {
    
    // MARK: - Properties:
    
    var viewModel: JobViewModel
    
    // MARK: - Lifecycle:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTopStories()
    }
    
    init(viewModel: JobViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods

    private func fetchTopStories() {
        viewModel.getTopStories { [weak self] response in
            guard let self else { return }
            
            self.viewModel.topStories = response
            
            self.updateDisplayData()
        }
    }
    
    private func updateDisplayData() {
        let firstIndex = viewModel.lastItemIndex + 1
        
        if firstIndex > viewModel.topStories.count - 1 {
            viewModel.isAllDataDisplayed = true
            
            return
        }
        
        let maxIndex = (viewModel.lastItemIndex + viewModel.limit) <= (viewModel.topStories.count - 1) ? (viewModel.lastItemIndex + viewModel.limit) : (viewModel.topStories.count - 1)
        
        viewModel.isUpdating = true
        
        for index in firstIndex...maxIndex {
            viewModel.getStoryById(id: viewModel.topStories[index]) { [weak self] stories in
                guard let self else { return }
                
                self.viewModel.displayStories.append(stories)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    
                    if self.viewModel.displayStories.count == maxIndex + 1 {
                        self.viewModel.isUpdating = true
                    }
                }
            }
        }
        viewModel.lastItemIndex = maxIndex
    }
}

// MARK: - TableViewDelegate/DataSource:

extension JobViewController {
    
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

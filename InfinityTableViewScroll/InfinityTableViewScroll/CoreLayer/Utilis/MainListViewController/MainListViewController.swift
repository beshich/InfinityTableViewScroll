//
//  TableViewController.swift
//  InfinityTableViewScroll
//
//  Created by Agatay Embeev on 28.02.2023.
//

import UIKit
import SnapKit

class MainListViewController: MainViewController {
    
    // MARK: - Properties:
    
    var reusableText: String? {
        didSet {
            reusableCell.textLabel?.text = reusableText
        }
    }
    
    var mainListViewModel: MainListViewModel
    
    var reusableCell = UITableViewCell()
    var cellIdentifier = "reusableCell"
    
    // MARK: UI Elements:
    
    lazy var tableView = UITableView(frame: .zero, style: .insetGrouped).apply {
        $0.delegate = self
        $0.dataSource = self
        $0.estimatedRowHeight = UITableView.automaticDimension
        $0.sectionHeaderHeight = UITableView.automaticDimension
        $0.keyboardDismissMode = .onDrag
        $0.separatorStyle = .none
        $0.contentInset = .init(top: 0, left: 0, bottom: 60, right: 0)
    }
    
    init(viewModel: MainListViewModel) {
        self.mainListViewModel = viewModel
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        setupBindings()
        mainListViewModel.viewDidLoad()
    }

    func setupViews() {
        title = mainListViewModel.title
        view.backgroundColor = .white
        tableView.backgroundColor = .clear
        view.addSubview(tableView)
    }

    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func setupBindings() {
        mainListViewModel.didUpdateSections = { [weak self] in
            guard let self else { return }
            
            self.tableView.reloadData()
        }
    }
}

// MARK: TableViewDelegate/DataSoruce:

extension MainListViewController: TableViewDelegateAndDataSourcesProtocol {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainListViewModel.sections.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mainListViewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        reusableCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        reusableText = mainListViewModel.sections[indexPath.row].title
        
        return reusableCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        return
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mainListViewModel.didSelectRowAt(indexPath: indexPath)
    }
}

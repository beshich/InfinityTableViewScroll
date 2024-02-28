//
//  TableViewController.swift
//  InfinityTableViewScroll
//
//  Created by Agatay Embeev on 28.02.2023.
//

import UIKit
import SnapKit

class MainListViewController: UIViewController {
    
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
    
    lazy var tableView = UITableView().apply {
        $0.delegate = self
        $0.dataSource = self
        $0.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    // MARK: - Lifecycle:
    
    init(mainListViewModel: MainListViewModel) {
        self.mainListViewModel = mainListViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

// MARK: - Setup Views:

extension MainListViewController {
    
    private func setupViews() {
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: TableViewDelegate/DataSoruce:

extension MainListViewController: TableViewDelegateAndDataSourcesProtocol {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        reusableCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        reusableCell.textLabel?.numberOfLines = 0
        reusableCell.textLabel?.lineBreakMode = .byWordWrapping
        
        return reusableCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        return
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }
}

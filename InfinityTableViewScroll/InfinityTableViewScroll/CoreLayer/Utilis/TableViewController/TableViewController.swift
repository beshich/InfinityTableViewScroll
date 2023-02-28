//
//  TableViewController.swift
//  InfinityTableViewScroll
//
//  Created by Agatay Embeev on 28.02.2023.
//

import UIKit
import SnapKit

class TableViewController: UIViewController {
    
    // MARK: UI Elements:
    
    lazy var tableView = UITableView().apply {
        $0.delegate = self
        $0.dataSource = self
    }
    
    // MARK: - Lifecycle:

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

// MARK: - Setup Views:

extension TableViewController {
    
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

extension TableViewController: TableViewDelegateAndDataSourcesProtocol {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

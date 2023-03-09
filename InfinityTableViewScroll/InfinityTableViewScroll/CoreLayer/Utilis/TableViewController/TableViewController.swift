//
//  TableViewController.swift
//  InfinityTableViewScroll
//
//  Created by Agatay Embeev on 28.02.2023.
//

import UIKit
import SnapKit

class TableViewController: UIViewController {
    
    // MARK: - Properties:
    
    var reusableCell = UITableViewCell()
    
    // MARK: UI Elements:
    
    lazy var tableView = UITableView().apply {
        $0.delegate = self
        $0.dataSource = self
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
        reusableCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
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

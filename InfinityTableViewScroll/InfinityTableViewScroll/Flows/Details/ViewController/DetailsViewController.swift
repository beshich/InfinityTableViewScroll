//
//  DetailsViewController.swift
//  InfinityTableViewScroll
//
//  Created by Agatay Embeev on 06.03.2023.
//

import UIKit
import WebKit

final class DetailsViewController: UIViewController, WKUIDelegate {
    
    // MARK: - Properties:
    
    let viewModel: DetailsViewModel
    
    // MARK: UI Elements:
    
    private lazy var webViewConfiguration = WKWebViewConfiguration()
    
    private lazy var webView = WKWebView(frame: .zero, configuration: webViewConfiguration).apply {
        $0.uiDelegate = self
    }
    
    // MARK: - Lifecycle:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        loadWebView()
    }
    
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods:

extension DetailsViewController {
    
    private func loadWebView() {
        guard let url = viewModel.url, let myURL = URL(string: url) else { return }
        
        let request = URLRequest(url: myURL)
        
        webView.load(request)
    }
}

// MARK: - Setup Views:

extension DetailsViewController {
    
    private func setupViews() {
        view.addSubview(webView)
        
        tabBarController?.tabBar.isHidden = true
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        webView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

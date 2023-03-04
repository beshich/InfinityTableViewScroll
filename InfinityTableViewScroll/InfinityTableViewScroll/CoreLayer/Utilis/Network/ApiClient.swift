//
//  ApiClient.swift
//  InfinityTableViewScroll
//
//  Created by Agatay Embeev on 04.03.2023.
//

import Foundation

struct ApiClient {
    
    // MARK: - Properties
    
    static let shared = ApiClient()
    
    let baseUrl = "https://hacker-news.firebaseio.com/v0"
}

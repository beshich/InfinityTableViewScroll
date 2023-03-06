//
//  DetailsViewModel.swift
//  InfinityTableViewScroll
//
//  Created by Agatay Embeev on 06.03.2023.
//

import UIKit

final class DetailsViewModel {
    
    // MARK: = Properties:
    
    var url: String?
    
    // MARK: Lifecycle:
    
    init(url: String? = nil) {
        self.url = url
    }
}

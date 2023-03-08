//
//  Stories.swift
//  InfinityTableViewScroll
//
//  Created by Agatay Embeev on 08.03.2023.
//

import Foundation

enum Stories: String, Codable {
    case top
    case ask
    case job
    case show
    
    var serviceName: String {
        switch self {
        case .top:
            return "/topstories.json"
        case .ask:
            return "/askstories.json"
        case .job:
            return "/jobstories.json"
        case .show:
            return "/showstories.json"
        }
    }
}

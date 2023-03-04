//
//  TopStoryModel.swift
//  InfinityTableViewScroll
//
//  Created by Agatay Embeev on 04.03.2023.
//

import Foundation

struct TopStoryModel: Codable {
    let by, title, type, url: String?
    let descendants, id, score, time: Int?
    let kids: [Int]?
}

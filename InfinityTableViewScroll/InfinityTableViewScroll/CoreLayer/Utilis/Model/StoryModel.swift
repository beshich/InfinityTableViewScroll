//
//  StoryModel.swift
//  InfinityTableViewScroll
//
//  Created by Agatay Embeev on 08.03.2023.
//

import Foundation

struct StoryModel: Codable {
    let by, title, type, url: String?
    let descendants, id, score, time: Int?
    let kids: [Int]?
}

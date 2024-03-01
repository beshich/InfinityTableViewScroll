//
//  MainListViewModel.swift
//  InfinityTableViewScroll
//
//  Created by Agatai Embeev on 28.02.2024.
//

import Foundation

protocol MainListViewModelInputProtocol {
    var stories: String { get set }
    var didUpdateSections: VoidCallback? { get set }
    var topStories: [Int] { get set }
    var sections: [StoryModel] { get set }
    var limit: Int { get set }
    var lastItemIndex: Int { get set }
    var isUpdating: Bool { get set }
    var isAllDataDisplayed: Bool { get set }
    var title: String { get set }
}

protocol MainListViewModelOutputProtocol {
    func viewDidLoad()
    func didSelectRowAt(indexPath: IndexPath)
    func didUpdateDisplayData()
}

extension MainListViewModelOutputProtocol {
    func didSelectRowAt(indexPath: IndexPath) {}
}

typealias MainListViewModel = MainListViewModelInputProtocol & MainListViewModelOutputProtocol

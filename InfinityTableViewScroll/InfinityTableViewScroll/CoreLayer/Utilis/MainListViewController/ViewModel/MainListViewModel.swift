//
//  MainListViewModel.swift
//  InfinityTableViewScroll
//
//  Created by Agatai Embeev on 28.02.2024.
//

import Foundation

protocol MainListViewModelInputProtocol {
    var stories: Stories { get set }
    var didUpdateSections: VoidCallback? { get set }
    var topStories: [Int] { get set }
    var displayStories: [StoryModel] { get set }
    var limit: Int { get set }
    var lastItemIndex: Int { get set }
    var isUpdating: Bool { get set }
    var isAllDataDisplayed: Bool { get set }
}

protocol MainListViewModelOutputProtocol {
    func viewDidLoad()
    func didSelectRowAt(indexPath: IndexPath)
}

typealias MainListViewModel = MainListViewModelInputProtocol & MainListViewModelOutputProtocol

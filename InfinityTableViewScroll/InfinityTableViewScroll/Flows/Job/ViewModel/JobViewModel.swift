//
//  JobViewModel.swift
//  InfinityTableViewScroll
//
//  Created by Agatay Embeev on 08.03.2023.
//

import Foundation

final class JobViewModel {
    
    // MARK: - Private Properties:
    
    private let stories = Stories.job.serviceName
    
    // MARK: - Properties:
    
    var didUpdateSection: Callback<Bool>?
    
    var topStories: [Int] = []
    var displayStories: [StoryModel] = []
    
    let limit = 20
    var lastItemIndex = -1
    var isUpdating = false
    var isAllDataDisplayed = false
    
    // MARK: - Lifecycle
    
    func viewDidLoad() {
        fetchTopStories()
    }
    
    // MARK: - Methods
    
    private func fetchTopStories() {
        getTopStories { [weak self] response in
            guard let self else { return }
            
            self.topStories = response
            self.updateDisplayData()
        }
    }
    
    func updateDisplayData() {
        let firstIndex = lastItemIndex + 1
        
        if firstIndex > topStories.count - 1 {
            isAllDataDisplayed = true
            
            return
        }
        
        let maxIndex = (lastItemIndex + limit) <= (topStories.count - 1) ? (lastItemIndex + limit) : (topStories.count - 1)
        
        isUpdating = true
        
        for index in firstIndex...maxIndex {
            getStoryById(id: topStories[index]) { [weak self] stories in
                guard let self else { return }
                
                self.displayStories.append(stories)
                
                if self.displayStories.count == maxIndex + 1 {
                    self.isUpdating = true
                    self.didUpdateSection?(true)
                }
            }
        }
        lastItemIndex = maxIndex
    }
    
    // MARK: - Request
    
    func getTopStories(completion: @escaping Callback<[Int]>) {
        guard let url = URL(string: "\(Constants.baseUrl)\(stories)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode([Int].self, from: data)
                
                completion(results)
            } catch {
                print("Error getTopStories: \(error)")
            }
        }
        task.resume()
    }
    
    func getStoryById(id: Int, completion: @escaping Callback<StoryModel>) {
        guard let url = URL(string: "\(Constants.baseUrl)/item/\(id).json") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(StoryModel.self, from: data)
                
                completion(results)
            } catch {
                print("Error getStoryById: \(error)")
            }
        }
        task.resume()
    }
}

//
//  AskViewModel.swift
//  InfinityTableViewScroll
//
//  Created by Agatay Embeev on 08.03.2023.
//

import Foundation

final class AskViewModel {
    
    // MARK: - Properties:
    
    var topStories: [Int] = []
    var displayStories: [StoryModel] = []
    
    let limit = 20
    var lastItemIndex = -1
    var isUpdating = false
    var isAllDataDisplayed = false
    
    // MARK: - Methods
    
    func getTopStories(completion: @escaping Callback<[Int]>) {
        guard let url = URL(string: "\(Constants.baseUrl)/askstories.json") else { return }
        
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

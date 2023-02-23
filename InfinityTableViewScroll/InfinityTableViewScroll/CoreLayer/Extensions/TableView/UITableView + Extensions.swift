//
//  UITableView + Extensions.swift
//  InfinityTableViewScroll
//
//  Created by Agatay Embeev on 23.02.2023.
//

import UIKit

extension UITableView {
    
    func registerCell<T: UITableViewCell>(_ cellClass: T.Type) {
        let cellId = String(describing: cellClass.self)
        
        register(cellClass.self, forCellReuseIdentifier: cellId)
    }
    
    func dequeueCell<T>(_ cellClass: T.Type, indexPath path: IndexPath) -> T {
        let cellId = String(describing: T.self)
        
        return dequeueReusableCell(withIdentifier: cellId, for: path) as! T
    }
}

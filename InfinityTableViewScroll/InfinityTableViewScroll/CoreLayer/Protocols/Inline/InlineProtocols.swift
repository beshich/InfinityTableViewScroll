//
//  InlineProtocols.swift
//  InfinityTableViewScroll
//
//  Created by Agatay Embeev on 21.02.2023.
//

import Foundation

public protocol InlineConfigurable {}

public extension InlineConfigurable {
    @discardableResult func apply(_ configurator: (Self) -> Void) -> Self  {
        configurator(self)
        
        return self
    }
}

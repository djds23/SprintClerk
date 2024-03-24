//
//  File.swift
//  
//
//  Created by Dean Silfen on 3/24/24.
//

import Foundation

public struct StandupFormatter {
    public var string: (Standup) -> String
}

extension StandupFormatter {
    static var `default`: Self {
        .init { standup in
            var base = [ "T" ]
            base += standup.today.todos.map { "* \($0.text)" }
            base += [ "Y" ]
            base += standup.yesterday.todos.map { "* \($0.text)" }
            return base.joined(separator: "\n")
        }
    }
}

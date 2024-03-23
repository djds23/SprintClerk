//
//  File.swift
//  
//
//  Created by Dean Silfen on 3/23/24.
//

import Foundation

public struct Day {
    public init(title: String, todos: [Todo]) {
        self.title = title
        self.todos = todos
    }
    
    public var title: String
    public var todos: [Todo]
}

public extension Day {
    static var mock: Day {
        Day(title: "Today", todos: [
            .init(text: "Build the day view"),
            .init(text: "Go for a walk with your family"),
            .init(text: "finish reading your book", isComplete: true)
        ])
    }

    static var completedDay: Day {
        Day(title: "Yesterday", todos: [
            .init(text: "Build the day view", isComplete: true),
            .init(text: "Go for a walk with your family", isComplete: true),
            .init(text: "finish reading your book", isComplete: true)
        ])
    }
}

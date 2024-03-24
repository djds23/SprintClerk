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
            .init(id: "1", text: "Build the day view"),
            .init(id: "2", text: "Go for a walk with your family"),
            .init(id: "3", text: "finish reading your book", isComplete: true)
        ])
    }

    static var emptyDay: Day {
        Day(title: "Today", todos: [])
    }

    static var completedDay: Day {
        Day(title: "Yesterday", todos: [
            .init(id: "4",text: "Build the day view", isComplete: true),
            .init(id: "5",text: "Go for a walk with your family", isComplete: true),
            .init(id: "6",text: "finish reading your book", isComplete: true)
        ])
    }
}

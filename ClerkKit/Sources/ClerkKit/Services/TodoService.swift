//
//  File.swift
//  
//
//  Created by Dean Silfen on 3/23/24.
//

import Foundation

public struct TodoService {
    public var makeTodo: () -> Todo

    public init(makeTodo: @escaping () -> Todo) {
        self.makeTodo = makeTodo
    }
}

public extension TodoService {
    static var mock: Self {
        .init {
            Todo(id: "\(Int.random(in: 0...Int.max))", text: "Do Something Great")
        }
    }
}

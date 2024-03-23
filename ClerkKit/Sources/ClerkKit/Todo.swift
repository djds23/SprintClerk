// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public struct Todo: Identifiable {
    public var id: String {
        text + "\(addedAt)"
    }
    public var text: String
    public var isComplete: Bool
    public var completedAt: Date?
    public var addedAt: Date = .init()

    public init(text: String, isComplete: Bool = false, completedAt: Date? = nil, addedAt: Date = .init()) {
        self.text = text
        self.isComplete = isComplete
        self.completedAt = completedAt
        self.addedAt = addedAt
    }
}

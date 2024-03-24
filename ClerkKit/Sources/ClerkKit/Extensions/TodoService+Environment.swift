//
//  File.swift
//  
//
//  Created by Dean Silfen on 3/23/24.
//

import Foundation
import SwiftUI

public struct TodoServiceEnvironmentKey: EnvironmentKey {
    public static let defaultValue: TodoService = .mock
}


extension EnvironmentValues {
    public var todoService: TodoService {
        get { self[TodoServiceEnvironmentKey.self] }
        set { self[TodoServiceEnvironmentKey.self] = newValue }
    }
}


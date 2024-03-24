//
//  IsCollapsed+Environment.swift
//  SprintClerk
//
//  Created by Dean Silfen on 3/23/24.
//

import Foundation
import SwiftUI

public struct IsBottomBarCollapsedEnvironmentKey: EnvironmentKey {
    public static let defaultValue: Bool = false
}


extension EnvironmentValues {
    public var isBottomBarCollapsed: Bool {
        get { self[IsBottomBarCollapsedEnvironmentKey.self] }
        set { self[IsBottomBarCollapsedEnvironmentKey.self] = newValue }
    }
}

extension View {
    func isBottomBarCollapsed(_ isCollapsed: Bool) -> some View {
        environment(\.isBottomBarCollapsed, isCollapsed)
    }
}

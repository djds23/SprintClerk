//
//  File.swift
//  
//
//  Created by Dean Silfen on 3/24/24.
//

import Foundation
import SwiftUI

public struct StandupFormatterEnvironmentKey: EnvironmentKey {
    public static let defaultValue: StandupFormatter = .default
}


extension EnvironmentValues {
    public var standupFormatter: StandupFormatter {
        get { self[StandupFormatterEnvironmentKey.self] }
        set { self[StandupFormatterEnvironmentKey.self] = newValue }
    }
}


//
//  File.swift
//  
//
//  Created by Dean Silfen on 3/23/24.
//

import Foundation
import SwiftUI

private struct TodoDateFormatterEnvironmentKey: EnvironmentKey {
    static let defaultValue: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
}


extension EnvironmentValues {
    var todoDateFormatter: DateFormatter {
        get { self[TodoDateFormatterEnvironmentKey.self] }
        set { self[TodoDateFormatterEnvironmentKey.self] = newValue }
    }
}


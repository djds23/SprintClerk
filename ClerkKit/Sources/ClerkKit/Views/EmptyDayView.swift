//
//  File.swift
//  
//
//  Created by Dean Silfen on 3/24/24.
//

import Foundation
import SwiftUI

public struct EmptyDayView: View {
    public init() { }

    @Environment(\.todoDateFormatter) var formatter
    public var body: some View {
        VStack(alignment: .leading, spacing: 9) {
            Text("Luck runs out, but safety is good for life")
                .italic()
                .font(.system(size: 21, weight: .semibold, design: .serif))
            Text("Go get em tiger")
                .font(.subheadline)
                .padding(.top, 1)
                .foregroundColor(.secondary)
            Text(formatter.string(from: Date()))
                .font(.system(size: 10, weight: .regular, design: .monospaced))
                .foregroundColor(.secondary)
        }
    }
}

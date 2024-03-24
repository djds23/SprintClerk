//
//  TodayView.swift
//  SprintClerk
//
//  Created by Dean Silfen on 3/24/24.
//

import ClerkKit
import Foundation
import SwiftUI

struct TodayView: View {
    @Binding var standup: Standup
    var body: some View {
        Group {
            if standup.today.todos.isEmpty {
                EmptyDayView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.all, 0)
                    .background {
                        Color(nsColor: .textBackgroundColor)
                    }
            } else {
                DayView(day: $standup.today)
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

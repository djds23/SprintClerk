//
//  SwiftUIView.swift
//  
//
//  Created by Dean Silfen on 3/23/24.
//

import SwiftUI

public struct TodayView: View {
    public init(standup: Binding<Standup>) {
        self._standup = standup
    }
    
    @Binding var standup: Standup
    public var body: some View {
        VStack {
            DayView(day: $standup.today)
            DayView(day: $standup.yesterday)
                .disabled(true)
        }
    }
}

#Preview {
    TodayView(
        standup: .constant(
            .init(
                today: .mock,
                yesterday: .completedDay
            )
        )
    )
}

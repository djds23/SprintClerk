//
//  SwiftUIView.swift
//  
//
//  Created by Dean Silfen on 3/23/24.
//

import ClerkKit
import SwiftUI

public struct TodayView: View {
    public init(standup: Binding<Standup>) {
        self._standup = standup
    }
    
    @Environment(\.todoService) var todoService
    @Binding var standup: Standup
    @State var isCollapsed = false
    public var body: some View {
        VSplitView {
            DayView(day: $standup.today)
                .frame(maxWidth: .infinity)
            Toggle(isOn: $isCollapsed, label: {
                Image(systemName: isCollapsed ? "chevron.down" : "chevron.up")
            })
            .buttonStyle(.borderless)
            .toggleStyle(.button)
            .padding(.vertical, 2)
            .frame(maxWidth: .infinity)
            if isCollapsed {
                DayView(day: $standup.yesterday)
                    .disabled(true)
                    .frame(maxWidth: .infinity)
            }
        }
        .toolbar(content: {
            ToolbarItem {
                Button(
                    action: {
                        let todo = todoService.makeTodo()
                        standup.today.todos.append(todo)
                    },
                    label: { Image(systemName: "plus") }
                )
            }
        }) 
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

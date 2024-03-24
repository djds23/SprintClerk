//
//  SwiftUIView.swift
//  
//
//  Created by Dean Silfen on 3/23/24.
//
import AppKit
import ClerkKit
import SwiftUI

public struct StandupView: View {
    public init(standup: Binding<Standup>) {
        self._standup = standup
    }
    
    @Environment(\.standupFormatter) var standupFormatter
    @Environment(\.todoService) var todoService
    @Binding var standup: Standup
    @State var isCollapsed = false
    public var body: some View {
        VStack {
            LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .leading, endPoint: .trailing)
                .frame(height: 2)
                .clipped()
            VSplitView {
                TodayView(standup: $standup)
                Toggle(isOn: $isCollapsed, label: {
                    Image(systemName: isCollapsed ? "chevron.down" : "chevron.up")
                        .padding(.vertical, 2)
                        .frame(maxWidth: .infinity)
                        .background {
                            Color(nsColor: .controlBackgroundColor)
                        }
                })
                .keyboardShortcut(KeyEquivalent("y"), modifiers: [.command, .shift])
                .buttonStyle(.borderless)
                .toggleStyle(.button)
                .frame(maxWidth: .infinity)
                if isCollapsed {
                    DayView(day: $standup.yesterday)
                        .disabled(true)
                        .frame(maxWidth: .infinity)
                }
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
                .keyboardShortcut(KeyEquivalent("n"), modifiers: [.command, .shift])
            }

            ToolbarItem {
                Button(
                    action: {
                        let string = standupFormatter.string(standup)
                        NSPasteboard.general.clearContents()
                        NSPasteboard.general.setString(string, forType: .string)
                    },
                    label: { Image(systemName: "square.and.arrow.up") }
                )
                .keyboardShortcut(KeyEquivalent("e"), modifiers: [.command])
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

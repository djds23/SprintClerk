//
//  File.swift
//  
//
//  Created by Dean Silfen on 3/23/24.
//

import Foundation
import SwiftUI


public struct TodoView: View {
    @Binding var todo: Todo
    @Environment(\.todoDateFormatter) var todoDateFormatter
    var now: Date = .init()
    public var body: some View {
        HStack {
            Button(
                action: {
                    todo.isComplete.toggle()
                }, label: {
                    image
                })
            .accessibilityAddTraits(.isToggle)
            TextField("What needs to get done?", 
                      text: $todo.text,
                                     prompt: Text("enter a long phrase to see how it scrolls"),
                                     axis: .horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(verbatim: todoDateFormatter.string(from: todo.addedAt))
        }
        .strikethrough(todo.isComplete)
    }

    @ViewBuilder
    var image: some View {
        Group {
            Image(
                systemName: todo.isComplete ? "checkmark.circle.fill" : "circle"
            )
            .foregroundStyle( todo.isComplete ? .green : .primary)
        }

    }
}

#Preview {
    Group {
        TodoView(todo: .constant(.init(id: "1", text: "Make the todoView", isComplete: false)))
            .padding()
        TodoView(todo: .constant(.init(id: "2", text: "Make the todoView", isComplete: true)))
            .padding()
    }
}

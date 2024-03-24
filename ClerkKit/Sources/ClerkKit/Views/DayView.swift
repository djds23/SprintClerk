//
//  SwiftUIView.swift
//  
//
//  Created by Dean Silfen on 3/23/24.
//

import SwiftUI

public struct DayView: View {
    public init(day: Binding<Day>) {
        self._day = day
    }
    
    @Binding var day: Day
    public var body: some View {
        WorkDayView(day: $day)
    }
}

public struct WorkDayView: View {
    public init(day: Binding<Day>) {
        self._day = day
    }

    @Binding var day: Day
    public var body: some View {
        VStack{
            Text(day.title)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.top, .leading])
            List($day.todos.sorted(by: { lhs, rhs in
                rhs.isComplete.wrappedValue
            })) { todo in
                TodoView(todo: todo)
                    .contextMenu(ContextMenu(menuItems: {
                        Button(
                            action: { day.todos.removeAll(where: { $0.id == todo.wrappedValue.id}) },
                            label: {
                            Text("Delete")
                        })
                    }))
            }
            .listStyle(.bordered(alternatesRowBackgrounds: true))
        }
    }
}


#Preview {
    DayView(day: .constant(.mock))
}

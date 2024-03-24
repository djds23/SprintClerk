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
        Text(day.title)
        List($day.todos.sorted(by: { lhs, rhs in
            rhs.isComplete.wrappedValue
        })) { todo in
            TodoView(todo: todo)
        }
    }
}

#Preview {
    DayView(day: .constant(.mock))
}

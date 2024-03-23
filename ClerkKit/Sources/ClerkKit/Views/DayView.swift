//
//  SwiftUIView.swift
//  
//
//  Created by Dean Silfen on 3/23/24.
//

import SwiftUI

public struct DayView: View {
    @Binding var day: Day
    public var body: some View {
        Text(day.title)
        List($day.todos) { todo in
            TodoView(todo: todo)
        }
    }
}

#Preview {
    DayView(day: .constant(.mock))
}

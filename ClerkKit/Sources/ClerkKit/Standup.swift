//
//  File.swift
//  
//
//  Created by Dean Silfen on 3/23/24.
//

import Foundation

public struct Standup {
    public init(today: Day, yesterday: Day) {
        self.today = today
        self.yesterday = yesterday
    }

    public var today: Day
    public var yesterday: Day
}

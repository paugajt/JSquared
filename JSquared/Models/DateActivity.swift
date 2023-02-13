//
//  DateActivityl.swift
//  JSquared
//
//  Created by Justin Pauga on 2/10/23.
//

import Foundation

struct DateActivity: Codable, Identifiable {
    var id: UUID = UUID()
    let activityName: String
    let status: DateStatus
    let proposedDate: Date?
    let completionDate: Date?
    let notes: String
    let creator: User
}

enum DateStatus: String, Equatable, Codable, CaseIterable {
    case notStarted = "Not Started"
    case inProgress = "In Progress"
    case complete = "Complete"
}


extension DateActivity {
    static func sampleData() -> [DateActivity] {
        [
            DateActivity(activityName: "Super awesome date", status: .inProgress, proposedDate: nil, completionDate: nil, notes: "", creator: User(name: "Test")),
            DateActivity(activityName: "Travel together!", status: .notStarted, proposedDate: Date(), completionDate: Date(), notes: "We went to Bali!", creator: User(name: "Mike")),
            DateActivity(activityName: "Butt stuff", status: .complete, proposedDate: Date(), completionDate: Date(), notes: "We did it in the butt!", creator: User(name: "Test"))
        ]
    }
}

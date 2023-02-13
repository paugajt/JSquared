//
//  ContentViewModel.swift
//  JSquared
//
//  Created by Justin Pauga on 2/10/23.
//

import Foundation

enum ContentViewTabItem {
    case future, personal, completed
}

class ContentViewModel: ObservableObject {
    var dateActivities: [DateActivity]
    @Published var futureDates: [DateActivity]
    @Published var personalDates: [DateActivity]
    @Published var completedDates: [DateActivity]

    init(dateActivities: [DateActivity]) {
        self.dateActivities = dateActivities
        self.futureDates = dateActivities.filter({ $0.status != .complete})
        self.personalDates = dateActivities.filter({ $0.status != .complete}) //TODO: Filter by creator
        self.completedDates = dateActivities.filter({ $0.status == .complete})
    }
    
    func emptyStateText(for contentType: ContentViewTabItem) -> String {
        switch contentType {
        case .completed:
            return "Wow, you haven't gone on a date yet???"
        default:
            return "Use the + button to suggest a date"
        }
    }
    
    func dateListViewModel(for contentType: ContentViewTabItem) -> DateListViewModel {
        switch contentType {
        case .future:
            return DateListViewModel(dates: futureDates, emptyBodyText: emptyStateText(for: .future))
        case .personal:
            return DateListViewModel(dates: personalDates, emptyBodyText: emptyStateText(for: .personal))
        case .completed:
            return DateListViewModel(dates: completedDates, emptyBodyText: emptyStateText(for: .completed))
        }
    }
}

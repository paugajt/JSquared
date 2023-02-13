//
//  DateDetailViewModel.swift
//  JSquared
//
//  Created by Justin Pauga on 2/11/23.
//

import Foundation

class DateDetailViewModel: ObservableObject {
    private var dateActivity: DateActivity?
    
    @Published var activityName: String = ""
    @Published var status: DateStatus = .notStarted
    @Published var proposedDate: Date = .now
    @Published var completionDate: Date = .now
    @Published var notes: String = ""
    
    init(dateActivity: DateActivity? = nil) {
        self.dateActivity = dateActivity
        self.activityName = dateActivity?.activityName ?? ""
        self.status = dateActivity?.status ?? .notStarted
        self.proposedDate = dateActivity?.proposedDate ?? .now
        self.completionDate = dateActivity?.completionDate ?? .now
        self.notes = dateActivity?.notes ?? ""
    }
    
    func ctaButtonTapped() {
        guard let dateActivity else {
            createNewActivity()
            return
        }
        
        // Replace existing activity
        print(dateActivity)
    }
    
    private func createNewActivity() {
        // create new activity and add it to the list
    }
}

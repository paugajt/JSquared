//
//  DateListViewModel.swift
//  JSquared
//
//  Created by Justin Pauga on 2/11/23.
//

import Foundation

class DateListViewModel: ObservableObject {
    @Published var dates: [DateActivity]
    @Published var emptyBodyText: String
    
    init(dates: [DateActivity], emptyBodyText: String) {
        self.dates = dates
        self.emptyBodyText = emptyBodyText
    }
}

//
//  DateListView.swift
//  JSquared
//
//  Created by Justin Pauga on 2/10/23.
//

import SwiftUI

struct DateListView: View {
    @ObservedObject var viewModel: DateListViewModel
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 20) {
                    ForEach(viewModel.dates) { date in
                        DateCardView(dateActivity: date)
                    }
                } 
                .padding()
            }
            .navigationTitle("JSquared")
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: NewDateView()) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct DateListView_Previews: PreviewProvider {
    static var previews: some View {
        DateListView(viewModel: DateListViewModel(dates: DateActivity.sampleData(), emptyBodyText: "Sample text"))
    }
}

//
//  ContentView.swift
//  JSquared
//
//  Created by Justin Pauga on 2/10/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        TabView {
            DateListView(viewModel: viewModel.dateListViewModel(for: .future))
                .tabItem{
                    Image(systemName: "calendar")
                    Text("All dates")
                }
            DateListView(viewModel: viewModel.dateListViewModel(for: .personal))
                .tabItem {
                    Image(systemName: "opticaldiscdrive")
                    Text("My proposed dates")
                }
            DateListView(viewModel: viewModel.dateListViewModel(for: .completed))
                .tabItem {
                    Image(systemName: "books.vertical.fill")
                    Text("Past dates")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel(dateActivities: DateActivity.sampleData()))
    }
}

//
//  DateCardView.swift
//  JSquared
//
//  Created by Justin Pauga on 2/10/23.
//

import SwiftUI

struct DateCardView: View {
    @State var dateActivity: DateActivity
    @State var notes: String = ""
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                title
                    .padding(.bottom, 20)
                dateInfo
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                notesView
                    .padding(.horizontal, 20)
            }
            .frame(minHeight: 200)
            .padding()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 1)
        )
    }
}

private extension DateCardView {
    var title: some View {
        Text(dateActivity.activityName)
            .font(.title)
            .fontWeight(.bold)
    }
    
    var dateInfo: some View {
        VStack {
            proposedDate
            completionDate
        }
    }
    
    var proposedDate: some View {
        HStack {
            Text("Proposed Date:")
            Spacer()
            if let date = dateActivity.proposedDate {
                Text(dateFormatter.string(from: date))
            } else {
                Text("N/A")
            }
        }
    }
    
    var completionDate: some View {
        HStack {
            Text("Completion Date:")
            Spacer()
            if let date = dateActivity.completionDate {
                Text(dateFormatter.string(from: date))
            } else {
                Text("N/A")
            }
        }
    }
    
    var notesView: some View {
        TextField(dateActivity.notes, text: $notes)
            .textFieldStyle(.roundedBorder)
    }
}

struct DateCardView_Previews: PreviewProvider {
    static var previews: some View {
        DateCardView(dateActivity: DateActivity.sampleData()[0])
    }
}

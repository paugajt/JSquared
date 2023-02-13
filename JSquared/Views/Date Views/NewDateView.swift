//
//  NewDateView.swift
//  JSquared
//
//  Created by Justin Pauga on 2/10/23.
//

import SwiftUI

struct NewDateView: View {
    @ObservedObject var viewModel: DateDetailViewModel
    var body: some View {
        Form {
            VStack(alignment: .center) {
                Section("Date Information") {
                    TextField("Activity", text: $viewModel.activityName)
                    Picker("Date Status", selection: $viewModel.status) {
                        ForEach(DateStatus.allCases, id: \.self) { value in
                            Text(value.rawValue)
                                .tag(value)
                        }
                    }
                }
                Section("Dates") {
                    DatePicker(selection: $viewModel.proposedDate, in: Date.now..., displayedComponents: .date) {
                        Text("Proposed date")
                    }
                    DatePicker(selection: $viewModel.completionDate, in: ...Date.now, displayedComponents: .date) {
                        Text("Completion date")
                    }
                }
                Section("Notes") {
                    TextEditor(text: $viewModel.notes)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )

                }
            }
        }
        Button {
            print("Save pressed")
        } label: {
            Text("Save")
                .padding()
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .background(Color.blue)
        .clipShape(Capsule())
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
    }
}

struct NewDateView_Previews: PreviewProvider {
    static var previews: some View {
        NewDateView(viewModel: DateDetailViewModel())
    }
}

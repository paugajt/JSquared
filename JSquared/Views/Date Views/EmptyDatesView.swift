//
//  EmptyDatesView.swift
//  JSquared
//
//  Created by Justin Pauga on 2/11/23.
//

import SwiftUI

struct EmptyDatesView: View {
    var bodyMessage: String
    var body: some View {
        VStack {
            Image(systemName: "e.square")
                .resizable()
                .frame(width: 40, height: 40)
                .padding(.bottom, 40)
            Text("Wow such empty!")
                .font(.title)
                .fontWeight(.bold)
            Text(bodyMessage)
                .font(.callout)
        }
    }
}

struct EmptyDatesView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyDatesView(bodyMessage: "Use the + button to suggest a date")
    }
}

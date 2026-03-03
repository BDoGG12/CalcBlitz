//
//  QuestionView.swift
//  CalcBlitz
//
//  Created by Ben Do on 3/2/26.
//

import SwiftUI

struct QuestionView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Question 1")
                    .font(.largeTitle)
                Text("2 x 10:")
                    .font(.title)
                    .padding()
                TextField("Answer", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button("Next") {
                    print("next question")
                }
                .font(.title)
                .buttonBorderShape(.automatic)
                
            }
        }
        
        
    }
}

#Preview {
    QuestionView()
}

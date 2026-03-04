//
//  QuestionView.swift
//  CalcBlitz
//
//  Created by Ben Do on 3/2/26.
//

import SwiftUI
import SwiftData

struct QuestionView: View {
    @Environment(\.modelContext) private var context: ModelContext
    @Bindable var user: User
    @State private var vm = QuestionViewModel()
    
    // Question Number variable
    @State private var indexNum: Int = 1
    
    // Prompt variable
    @State private var prompt = "1 + 1"
    
    // User's input
    @State private var userInput: String = ""
    
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    
                    HStack {
                        Text("\(indexNum))")
                            .font(.largeTitle)
                        Text("\(vm.questionModel.questions[indexNum].prompt)")
                            .font(.largeTitle)
                    }
                    .padding()
                    
                    TextField("Answer", text: $userInput)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        
                    
                }
                
                
                Button("Next") {
                    print("next question")
                    self.nextQuestion()
                }
                .font(.title)
                .buttonBorderShape(.automatic)
                
            }
        }
        
        
    }
    
    func updateScore() {
        // check if the user's input matches the answer
        if (Int(userInput) == vm.questionModel.questions[indexNum].answer) {
            user.score += 1
        } else {
            user.score -= 1
        }
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func nextQuestion() {
        // Change the question number
        if indexNum < vm.questionModel.questions.count - 1 {
            self.indexNum += 1
            
            prompt = vm.questionModel.questions[indexNum].prompt
        }
    }
}

#Preview {
    QuestionView(user: User(score: 0))
}

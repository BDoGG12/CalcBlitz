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
    var category: String
    @State private var vm = QuestionViewModel()
    
    // Question Number variable
    @State private var indexNum: Int = 0
    
    // Prompt variable
    @State private var prompt = "1 + 1"
    
    // User's input
    @State private var userInput: String = ""
    
    // Game is done
    @State private var isDone: Bool = false
    
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [
                .blue.opacity(0.75),
                .green.opacity(0.4),
                .pink.opacity(0.9)
            ],
                           startPoint: .top,
                           endPoint: .bottom
            )
            .ignoresSafeArea()
            VStack {
                VStack {
                    
                    HStack {
                        Text("\(vm.questionModel.questions[indexNum].id))")
                            .font(.largeTitle)
                        Text("\(vm.questionModel.questions[indexNum].prompt)")
                            .font(.largeTitle)
                    }
                    .font(.title)
                    .bold()
                    .padding()
                    
                    TextField("Answer", text: $userInput)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 150)
                        .keyboardType(.numberPad)
                    
                    
                }
                
                
                Button("Next") {
                    print("next question")
                    self.nextQuestion()
                }
                .font(.title)
                .bold()
                .buttonBorderShape(.roundedRectangle)
                
            }
        }
        .onAppear {
            vm.fetchQuestion(category: category)
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
        if indexNum < vm.questionModel.questions.count {
            self.indexNum += 1
            
            prompt = vm.questionModel.questions[indexNum].prompt
            isDone = indexNum == vm.questionModel.questions.count
        }
    }
}

#Preview {
    QuestionView(user: User(score: 0), category: "addition")
}

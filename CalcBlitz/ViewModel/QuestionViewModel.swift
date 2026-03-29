//
//  QuestionViewModel.swift
//  CalcBlitz
//
//  Created by Ben Do on 3/2/26.
//

import Foundation

@Observable
class QuestionViewModel {
    
    var questionModel: QuestionModel = Bundle.main.decode("calcblitz_addition_20.json")
    
    // method to fetch and reassign the question model based on user's category selection
    
    func fetchQuestion(category: String) {
        
        switch category {
        case "addition":
            questionModel = Bundle.main.decode("calcblitz_addition_20.json")
            break
        case "subtraction":
            questionModel = Bundle.main.decode("calcblitz_subtraction_20.json")
            break
        case "multiplication":
            questionModel = Bundle.main.decode("calcblitz_multiplication_20.json")
            break
        case "division":
            questionModel = Bundle.main.decode("calcblitz_division_20.json")
            break
        default:
            break
        }
        
    }
    
}

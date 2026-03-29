//
//  CategoryView.swift
//  CalcBlitz
//
//  Created by Ben Do on 3/10/26.
//

import SwiftUI

struct CategoryView: View {
    
    let categories = [
        Category(title: "Addition", subtitle: "Practice adding numbers", icon: "plus", color: .green),
        Category(title: "Subtraction", subtitle: "Practice subtracting numbers", icon: "minus", color: .orange),
        Category(title: "Multiplication", subtitle: "Practice multiplying numbers", icon: "xmark", color: .blue),
        Category(title: "Division", subtitle: "Practice dividing numbers", icon: "divide", color: .purple)
    ]
    
    var body: some View {
        VStack {
            Section(header: Text("Select a category").font(.headline).fontWeight(.bold)) {
                List(categories) { category in
                    NavigationLink(category.title) {
                        QuestionView(user: User(score: 0), category: category.title.lowercased())
                    }
                    .font(.title)
                    .fontWeight(.bold)
                }
            }
            
        }
    }
}

#Preview {
    CategoryView()
}

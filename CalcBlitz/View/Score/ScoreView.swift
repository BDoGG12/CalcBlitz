//
//  ScoreView.swift
//  CalcBlitz
//
//  Created by Ben Do on 3/4/26.
//

import SwiftUI
import SwiftData

struct ScoreView: View {
    let score: Int
    let maxScore: Int
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [
                .blue.opacity(0.9),
                .purple.opacity(0.85)
            ], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            VStack(spacing: 24) {
                Text("Your Score")
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(.white.opacity(0.85))
                
                VStack(spacing: 12) {
                    Text("\(score)")
                        .font(.system(size: 72, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                    
                    Text("out of \(maxScore)")
                        .font(.title3.weight(.medium))
                        .foregroundStyle(.white.opacity(0.8))
                }
                .padding(.vertical, 36)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 28, style: .continuous)
                        .fill(.white.opacity(0.12))
                        .background(
                            RoundedRectangle(cornerRadius: 28, style: .continuous)
                                .fill(.ultraThinMaterial)
                        )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 28, style: .continuous)
                        .stroke(.white.opacity(0.15), lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.18), radius: 20, x: 0, y: 12)
                
                HStack(spacing: 16) {
                    ScoreStatView(title: "Score", value: "\(score)")
                    ScoreStatView(title: "Max Score", value: "\(maxScore)")
                }
            }
        }
    }
}

#Preview {
    ScoreView(score: 20, maxScore: 20)
}

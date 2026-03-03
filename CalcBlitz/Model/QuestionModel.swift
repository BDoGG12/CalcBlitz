//
//  QuestionModel.swift
//  CalcBlitz
//
//  Created by Ben Do on 3/2/26.
//

import Foundation

struct QuestionModel: Codable {
    let category: String
    let questions: [Question]
    let count: Int
    
    enum CodingKeys: String, CodingKey {
        case category, questions, count
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.category = try container.decode(String.self, forKey: .category)
        self.questions = try container.decode([Question].self, forKey: .questions)
        self.count = try container.decode(Int.self, forKey: .count)
    }
}

struct Question: Identifiable, Codable {
    let id: Int
    let type: String
    let operands: [Int]
    let prompt: String
    let answer: Int
    
    enum CodingKeys: String, CodingKey {
        case id, type, operands, prompt, answer
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.type = try container.decode(String.self, forKey: .type)
        self.operands = try container.decode([Int].self, forKey: .operands)
        self.prompt = try container.decode(String.self, forKey: .prompt)
        self.answer = try container.decode(Int.self, forKey: .answer)
    }
}

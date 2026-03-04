//
//  User.swift
//  CalcBlitz
//
//  Created by Ben Do on 3/4/26.
//

import Foundation
import SwiftData


@Model
final class User {
    var score: Int = 0
    
    init(score: Int) {
        self.score = score
    }
}

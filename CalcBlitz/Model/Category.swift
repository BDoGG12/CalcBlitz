//
//  Category.swift
//  CalcBlitz
//
//  Created by Ben Do on 3/2/26.
//

import SwiftUI

struct Category: Identifiable {
    let id: UUID = UUID()
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
}

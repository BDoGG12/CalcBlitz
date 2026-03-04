//
//  Bundle+Extension.swift
//  CalcBlitz
//
//  Created by Ben Do on 3/2/26.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        // 1. Locate the file URL in the app bundle
        guard let fileURL = self.url(forResource: file, withExtension: nil) else {
            fatalError("Couldn't find \(file) in the app bundle.")
        }
        
        // 2. Load the file data
        guard let data = try? Data(contentsOf: fileURL) else {
            fatalError("Couldn't load \(file) as Data.")
        }
        
        // 3. Decode the data into specified type (T)
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        // 4. Return the ready to use Swift object
        return decodedData
    }
}

//
//  StringCalculator.swift
//  Incubyte_assignment
//
//  Created by Prajjwal on 28/06/25.
//

import Foundation

struct StringCalculator {
    func add(_ numbers: String) throws -> Int {
        if numbers.isEmpty {
            return 0
        }

        var delimiter = ","
        var numberString = numbers

        if numbers.starts(with: "//") {
            let parts = numbers.split(separator: "\n", maxSplits: 1)
            delimiter = String(parts[0].dropFirst(2))
            numberString = String(parts[1])
        }

        let numberArray = numberString.split { char in
            char == Character(delimiter) || char == "\n"
        }
        
        var negativeNumbers: [Int] = []
        var sum = 0
        for numberStr in numberArray {
            guard let number = Int(numberStr) else {
                continue
            }
            if number < 0 {
                negativeNumbers.append(number)
            } else if number <= 1000 {
                sum += number
            }
        }

        if !negativeNumbers.isEmpty {
            throw NSError(domain: "StringCalculatorError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Negatives not allowed: \(negativeNumbers.map(String.init).joined(separator: ","))"])
        }

        return sum
    }
}

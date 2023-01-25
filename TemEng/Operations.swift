//
//  Operations.swift
//  TemEng
//
//  Created by Florian Klenk
//

import Foundation

public func calculateAverage(numbers: [Int]) -> Double {
    let sum = numbers.reduce(0, +)
    let average = Double(sum) / Double(numbers.count)
    return average
}

public func calculateSum(numbers: [Int]) -> Int {
    let sum = numbers.reduce(0, +)
    return sum
}

public func findLargestNumber(numbers: [Int]) -> Int {
    return numbers.max()!
}

public func findSmallestNumber(numbers: [Int]) -> Int {
    return numbers.min()!
}

let operations = [calculateAverage, calculateSum, findLargestNumber, findSmallestNumber]


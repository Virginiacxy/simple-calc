//
//  main.swift
//  SimpleCalc
//
//  Created by Xinyue Chen on 10/6/17.
//  Copyright © 2017 Xinyue Chen. All rights reserved.
//

import Foundation

print("Enter an expression separated by returns:")

let response = readLine(strippingNewline: true)!.trimmingCharacters(in: .whitespacesAndNewlines)
let responseArr = response.components(separatedBy: " ")

// determine it's three-line calculation or one-line
if responseArr.count == 1 {
    let operand1 = Double(response)!
    // trim the whitespaces in input
    let op = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
    let thirdLine = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
    
    let operand2 = Double(thirdLine)!
    var result:Double = 0
    // do the corresponding calculation according to the operator
    switch op {
        case "+": result = operand1 + operand2
        case "-": result = operand1 - operand2
        case "*": result = operand1 * operand2
        case "/": result = operand1 / operand2
        case "%": result = operand1.truncatingRemainder(dividingBy: operand2)
        default: print("Result: \(operand1) \(op) \(operand2)")
    }
    if result == Double(Int(result)) {
        print("Result: \(Int(result))")
    } else {
        print("Result: \(result)")
    }
} else {
    let op = responseArr[responseArr.count - 1]
    let count = responseArr.count - 1
    switch op {
        case "count": print(count)
        case "avg":
            var sum:Double = 0
            for var i in 0..<count {
                sum += Double(responseArr[i])!
                i += 1
            }
            let avg = sum / Double(count)
            if avg == Double(Int(avg)) {
                print(Int(avg))
            } else {
                print(avg)
            }
        case "fact":
            let num = Double(responseArr[0])!
            if num != Double(Int(num)) {
                print("Please enter an integer for factorial calculation")
            } else {
                var fact = 1
                if num < 0 {
                    print("Bad input")
                } else if num == 0 {
                    print("1")
                } else {
                    for var i in 1...Int(num) {
                        fact = fact * i
                        i += 1
                    }
                    print(fact)
                }
            }
        default: print("Non-standard operation command")
    }
}

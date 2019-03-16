//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Churong Zhang on 3/14/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermidiateCalculation:(n1: Double, CalcMethod: String)?
    
    mutating func setNumber(_ number: Double)
    {
        self.number = number
    }
    private func performCalculation(_ n2: Double) -> Double?
    {
        if let n1 = intermidiateCalculation?.n1, let operation = intermidiateCalculation?.CalcMethod
        {
            switch operation
            {
            case "+":
                return n1 + n2
            case "×":
                return n1 * n2
            case "-":
                return n1 - n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation does not match any case.")
            }
        }
        else
        {
            return nil
        }
        
    }
    mutating func calculate(symbol : String) -> Double?
    {
        if let n = number
        {
            switch symbol
            {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%" :
                return n * 0.0
            case "=":
                return performCalculation(n)
            default:
                intermidiateCalculation = (n1: n, CalcMethod: symbol)
                return nil
            }
        }
        return nil
        
    }
    
}

//
//  Numbers+Utils.swift
//
//  Created by Chris Comeau on 2018-09-05.
//  Copyright © 2018 Skyriser Media. All rights reserved.
//

import Foundation
import UIKit

//https://www.hackingwithswift.com/articles/141/8-useful-swift-extensions
extension Comparable {
    func clamp(low: Self, high: Self) -> Self {
        //let number1 = 5
        //print(number1.clamp(low: 0, high: 10))
        if self > high {
            return high
        } else if self < low {
            return low
        }

      return self
    }
}

//https://stackoverflow.com/questions/31021197/how-to-add-commas-to-a-number-in-swift
//let number = 31908551587
//print(number.delimiter) // 31,908,551,587

extension Int {
    private static var numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal

      return numberFormatter
    }()

  var delimiter: String {
        return Int.numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}

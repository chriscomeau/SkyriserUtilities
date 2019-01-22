//
//  Date+Utils.swift
//
//  Created by Chris Comeau on 2018-09-05.
//  Copyright © 2018 Skyriser Media. All rights reserved.
//

import Foundation
import UIKit

public extension Date {
    func days(between otherDate: Date) -> Int {
      let calendar = Calendar.current

      let startOfSelf = calendar.startOfDay(for: self)
      let startOfOther = calendar.startOfDay(for: otherDate)
      let components = calendar.dateComponents([.day], from: startOfSelf, to: startOfOther)

      return abs(components.day ?? 0)
    }
}

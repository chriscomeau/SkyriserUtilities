//
//  Haptics+Utils.swift
//
//  Created by Chris Comeau on 2018-08-03.
//  Copyright © 2018 Test. All rights reserved.
//

import Foundation
import SystemConfiguration
import UIKit

class Haptics {

		static func haptic1() {

        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.prepare()
        generator.impactOccurred()
    }

    static func haptic2() {

        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.prepare()
        generator.impactOccurred()
    }

    static func hapticScroll() {

        let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
        selectionFeedbackGenerator.prepare()
        selectionFeedbackGenerator.selectionChanged()
    }

}

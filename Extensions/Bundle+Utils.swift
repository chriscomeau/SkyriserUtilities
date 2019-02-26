//
//  Bundle+Utils.swift
//
//  Created by Chris Comeau on 2019-01-19.
//  Copyright © 2019 Skyriser Media. All rights reserved.
//

import Foundation
import UIKit

public extension Bundle {

  var appName: String {
    return infoDictionary?["CFBundleName"] as! String
  }

  var bundleId: String {
    return bundleIdentifier!
  }

  var versionNumber: String {
    return infoDictionary?["CFBundleShortVersionString"] as! String
  }

  var buildNumber: String {
    return infoDictionary?["CFBundleVersion"] as! String
  }
}

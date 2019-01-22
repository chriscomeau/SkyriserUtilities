//
//  App+Utils.swift
//
//  Created by Christian Comeau on 2018-08-03.
//  Copyright © 2018 Test. All rights reserved.
//

import Foundation
import SystemConfiguration
import UIKit

public struct App {

  public static var isSimulator: Bool {
		//return (TARGET_IPHONE_SIMULATOR != 0)

    #if targetEnvironment(simulator)
			return true
		#else
			return false
		#endif
	}

  public static var isIpad: Bool {
		return (UIDevice.current.userInterfaceIdiom == .pad)
	}

  public static var isDebug: Bool {
		return _isDebugAssertConfiguration()
	}

  //	static func appDelegate () -> AppDelegate
//	{
//			return UIApplication.shared.delegate as! AppDelegate
//	}
}

struct RuntimeError: Error {
	let message: String

  init(_ message: String) {
		self.message = message
	}

  public var localizedDescription: String {
		return message
	}
}

//
//  App+Utils.swift
//
//  Created by Christian Comeau on 2018-08-03.
//  Copyright © 2018 Test. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
	func showAlert(title: String, message: String) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))
		self.present(alert, animated: true, completion: nil)
	}

}

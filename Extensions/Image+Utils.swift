//
//  Image+Utils.swift
//
//  Created by Chris Comeau on 2018-09-05.
//  Copyright © 2018 Skyriser Media. All rights reserved.
//

import Foundation
import UIKit

public extension UIImage
{
    static let empty = UIImage(named:"default")!

    public func saveToPhotos(completionTarget: AnyObject?, completionSelector: Selector?) {
        UIImageWriteToSavedPhotosAlbum(self, completionTarget, completionSelector, nil)
    }

    public func resized(toHeight points: CGFloat) -> UIImage? {
        let height = points * scale
        let ratio = height / size.height
        let width = size.width * ratio
        let newSize = CGSize(width: width, height: height)
        return resized(toSize: newSize)
    }

    public func resized(toSize newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, false, scale)
        draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }

    public func resized(toWidth points: CGFloat) -> UIImage? {
        let width = points * scale
        let ratio = width / size.width
        let height = size.height * ratio
        let newSize = CGSize(width: width, height: height)
        return resized(toSize: newSize)
    }

}

public extension UIImageView {
    func setCustomImage(_ imgURLString: String?) {
        guard imgURLString != nil else {
            self.image = UIImage.empty
            return
        }

        if let urlString = imgURLString {
            if let url = URL(string:urlString) {

                let task = URLSession.shared.dataTask(with:url) { (data, response, error) in

                    guard data != nil else {
                        print("invalid data")
                        return
                    }
                    guard error == nil else {
                        print("error: \(String(describing: error))")
                        return
                    }
                    //data image
                    DispatchQueue.main.async {
                        if let data = data {
                            self.image = UIImage(data: data)
                        }
                    }
                }

                task.resume()
            }
        }
    }
}

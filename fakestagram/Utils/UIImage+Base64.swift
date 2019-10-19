//
//  UIImage+Base64.swift
//  fakestagram
//
//  Created by Jhovan Gallardo on 19/10/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

extension UIImage {
    func base64() -> String {
        let data = self.jpegData(compressionQuality: 90)!
        let encoded = data.base64EncodedString(options: .lineLength64Characters)
        return "data:image/jpg;base64,\(encoded)"
    }
}

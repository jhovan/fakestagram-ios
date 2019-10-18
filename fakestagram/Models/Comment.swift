//
//  Comment.swift
//  fakestagram
//
//  Created by Jhovan Gallardo on 12/10/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

struct Comment: Codable {
    let content: String
    let author: Author?
}

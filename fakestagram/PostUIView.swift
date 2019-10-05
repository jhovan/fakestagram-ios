//
//  PostUIView.swift
//  fakestagram
//
//  Created by Jhovan Gallardo on 9/28/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

struct Author: Codable {
    let name: String
}

/*
struct Comment: Codable {
    let content: String
    let autor: Autor
}
 */

class PostUIView: UIView {
    var post: Post? {
        didSet {
            updatePostView()
        }
    }
    
    @IBOutlet var imagen: UIImageView!
    
    func updatePostView(){
        
    }
}

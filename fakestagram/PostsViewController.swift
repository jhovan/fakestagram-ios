//
//  PostsViewController.swift
//  fakestagram
//
//  Created by Jhovan Gallardo on 18/10/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var posts : [Post]? {
        didSet {
            self.postsCollection.reloadData()
            
        }
    }
    
    let client = RestClient<[Post]>(client: Client.fakestagram, basePath: "/api/v1/posts/")
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.posts?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath)
        cell.backgroundColor = .yellow
        return cell
    }
    
    @IBOutlet weak var postsCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postsCollection.delegate = self
        postsCollection.dataSource = self
        client.show {[unowned self] data in
            self.posts = data
            print(data)
            
        }
    }

// MARK:- Flow Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height*0.8)
    }

}

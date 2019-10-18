//
//  Aurthor.swift
//  fakestagram
//
//  Created by Jhovan Gallardo on 12/10/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

@IBDesignable
class AuthorView: UIView {
    
//    var author: Author? {
//        didSet {updateContent()}
//    }
    
    @IBInspectable
    var name: String? {
        didSet {
            guard let name = self.name else {return}
            nameLbl.text = name
        }
    }
    
    let avatar: UIView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName:"profile.circle.fill")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Lorem ipsum"
        return lbl
    }()
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConstraints()
    }
    
    func setupConstraints () {
        addSubview(avatar)
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: self.topAnchor, constant: 3),
            avatar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
            avatar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 3),
            //avatar.heightAnchor.constraint(equalToConstant: self.frame.height - 6)
        ])
        addSubview(nameLbl)
        NSLayoutConstraint.activate([
            nameLbl.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 5),
            nameLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 3),
            nameLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
//    func updateContent() {
//        guard let uauthor = author else {return}
//        nameLbl.text = uauthor.name
//    }
    
}

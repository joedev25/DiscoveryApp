//
//  TabBarView.swift
//  DiscoveryApp
//
//  Created by John Kulimushi on 19/07/2018.
//  Copyright © 2018 John Kulimushi. All rights reserved.
//

import UIKit

class TabBarView: UIView {
    
    let icons:[UIImage] = [#imageLiteral(resourceName: "explore"),#imageLiteral(resourceName: "bookmark"),#imageLiteral(resourceName: "drafts"),#imageLiteral(resourceName: "settings")]
    
    lazy var iconStack:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 0
        stack.backgroundColor = .red
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addIcons()
    }
    
    fileprivate func setup(){
        
        self.addSubview(iconStack)
        
        iconStack.topAnchor.constraint(equalTo: self.topAnchor,constant: 8).isActive = true
        iconStack.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -8).isActive = true
        iconStack.leadingAnchor.constraint(equalTo:  self.leadingAnchor,constant: 8).isActive = true
        iconStack.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -8).isActive = true
    }
    
    fileprivate func addIcons() {
        for icon in icons{
            let imageView = UIImageView(image: icon)
            imageView.contentMode = .scaleAspectFit
            iconStack.addArrangedSubview(imageView)
        }
    }

}






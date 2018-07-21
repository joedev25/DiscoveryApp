//
//  Cell.swift
//  DiscoveryApp
//
//  Created by John Kulimushi on 20/07/2018.
//  Copyright © 2018 John Kulimushi. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell {
    
    lazy var destImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setup(){
        addSubview(destImageView)
        
        destImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        destImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        destImageView.widthAnchor.constraint(equalTo:  self.widthAnchor,multiplier:0.95).isActive = true
        destImageView.heightAnchor.constraint(equalTo: self.heightAnchor,multiplier: 1).isActive = true
        
        
    }
}







































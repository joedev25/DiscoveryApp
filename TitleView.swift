//
//  TitleView.swift
//  DiscoveryApp
//
//  Created by John Kulimushi on 19/07/2018.
//  Copyright © 2018 John Kulimushi. All rights reserved.
//

import UIKit

class TitleView: UIView {
    
    lazy var title:UILabel = {
        let label = UILabel()
        label.text = "Discover"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var filterIcon:UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.image = #imageLiteral(resourceName: "filter")
        return icon
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setup(){
        
    }
}






















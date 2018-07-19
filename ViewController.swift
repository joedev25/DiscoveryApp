//
//  ViewController.swift
//  DiscoveryApp
//
//  Created by John Kulimushi on 18/07/2018.
//  Copyright © 2018 John Kulimushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var searchView:SearchView = {
        let view = SearchView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.lightGray.withAlphaComponent(0.6).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.7
        view.layer.masksToBounds = false
        view.clipsToBounds = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 4
        return view
    }()
    
    let tabbarView:TabBarView = {
        let view = TabBarView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cyan
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup() {
        
        //First add the field to the parent view which is self.
        view.addSubview(searchView)
        view.addSubview(tabbarView)
        
        //Second apply constraints
        searchView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchView.topAnchor.constraint(equalTo: view.topAnchor,constant: 40).isActive = true
        searchView.widthAnchor.constraint(equalTo:  view.widthAnchor,multiplier: 0.8).isActive = true
        searchView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        
        tabbarView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        tabbarView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tabbarView.leadingAnchor.constraint(equalTo:  self.view.leadingAnchor).isActive = true
        tabbarView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }


}







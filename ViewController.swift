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
    
    lazy var tabbarView:TabBarView = {
        let view = TabBarView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cyan
        return view
    }()
    
    lazy var titleView:TitleView = {
        let view = TitleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cyan
        return view
    }()
    
    lazy var container:UIView = {
        let view = UIView()
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
        view.addSubview(titleView)
        view.addSubview(container)
        
        //Second apply constraints
        searchView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchView.topAnchor.constraint(equalTo: view.topAnchor,constant: 40).isActive = true
        searchView.widthAnchor.constraint(equalTo:  view.widthAnchor,multiplier: 0.9).isActive = true
        searchView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        tabbarView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        tabbarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tabbarView.leadingAnchor.constraint(equalTo:  view.leadingAnchor).isActive = true
        tabbarView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        titleView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleView.topAnchor.constraint(equalTo: searchView.bottomAnchor,constant: 20).isActive = true
        titleView.widthAnchor.constraint(equalTo:  view.widthAnchor,multiplier: 0.9).isActive = true
        titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        container.topAnchor.constraint(equalTo: titleView.bottomAnchor,constant: 10).isActive = true
        container.bottomAnchor.constraint(equalTo: tabbarView.topAnchor,constant: -20).isActive = true
        container.leadingAnchor.constraint(equalTo:  view.leadingAnchor,constant: 20).isActive = true
        container.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
    }


}







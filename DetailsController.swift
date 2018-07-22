//
//  DetailsController.swift
//  DiscoveryApp
//
//  Created by John Kulimushi on 22/07/2018.
//  Copyright © 2018 John Kulimushi. All rights reserved.
//

import UIKit

class DetailsController: UIViewController {

    lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "1.jpeg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var townName:UILabel = {
        let label = UILabel()
        label.text = "New York 1"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var fullDescription:UILabel = {
        let label = UILabel()
        label.text = """
            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book
        """
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 10
        return label
    }()
    
    lazy var cancelButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.setImage(#imageLiteral(resourceName: "close"), for: .normal)
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        button.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        button.tintColor = .lightGray
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    
    func setup(){
        view.addSubview(imageView)
        view.addSubview(townName)
        view.addSubview(fullDescription)
        view.addSubview(cancelButton)
        
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.4).isActive = true
        imageView.leadingAnchor.constraint(equalTo:  view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        townName.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 20).isActive = true
        townName.heightAnchor.constraint(equalToConstant: 30).isActive = true
        townName.leadingAnchor.constraint(equalTo:  view.leadingAnchor,constant: 20).isActive = true
        townName.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        
        fullDescription.topAnchor.constraint(equalTo: townName.bottomAnchor,constant: 10).isActive = true
        fullDescription.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.2).isActive = true
        fullDescription.leadingAnchor.constraint(equalTo:  view.leadingAnchor,constant: 20).isActive = true
        fullDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        
        cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        cancelButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
     @objc fileprivate func goBack(){
        dismiss(animated: true, completion: nil)
    }
}

















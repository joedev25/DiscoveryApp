//
//  ViewController.swift
//  DiscoveryApp
//
//  Created by John Kulimushi on 18/07/2018.
//  Copyright © 2018 John Kulimushi. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    let cellId = "cell"
    let xInset:CGFloat = 30
    let animator = Animator()
    
    var destinations = [Destination](){
        didSet{
            collectionView.reloadData()
        }
    }
    
    lazy var searchView:SearchView = {
        let view = SearchView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.lightGray.withAlphaComponent(0.6).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.7
        view.backgroundColor = .white
        view.layer.cornerRadius = 7
        return view
    }()
    
    lazy var tabbarView:TabBarView = {
        let view = TabBarView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleView:TitleView = {
        let view = TitleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var container:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.lightGray.withAlphaComponent(0.7).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 15
        view.layer.shadowOpacity = 0.7
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var townName:UILabel = {
        let label = UILabel()
        label.text = "New York 1"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var shortDescription:UILabel = {
        let label = UILabel()
        label.text = "Sample text sample samsplemmmmsadknknknda"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    lazy var labelsStack:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [townName,shortDescription])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 0
        stack.alpha = 0
        return stack
    }()
    
    
    //Here lazy var is very important because it allows us to set the
    //delegate and datasource inside the closure
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //This is clear enough about what it does
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(Cell.self, forCellWithReuseIdentifier: cellId)
        view.backgroundColor = .white
        setup()
        loadDestinations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func loadDestinations(){
        var localDestinations = [Destination]()
        for i in 1...11{
            let image = UIImage(named: "\(i).jpeg")
            let dest = Destination(image: image!, townName: "New York \(i)", description: "sample description,sample description sample description")
            localDestinations.append(dest)
        }
        
        destinations =  localDestinations
    }
    
    func setup() {
        
        //First add the field to the parent view which is self.
        view.addSubview(searchView)
        view.addSubview(tabbarView)
        view.addSubview(titleView)
        view.addSubview(container)
        view.addSubview(collectionView)
        container.addSubview(labelsStack)
        
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
        
        container.topAnchor.constraint(equalTo: titleView.bottomAnchor,constant: 80).isActive = true
        container.bottomAnchor.constraint(equalTo: tabbarView.topAnchor,constant: -20).isActive = true
        container.leadingAnchor.constraint(equalTo:  view.leadingAnchor,constant: 20).isActive = true
        container.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: titleView.bottomAnchor,constant: 20).isActive = true
        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.4).isActive = true
        collectionView.leadingAnchor.constraint(equalTo:  view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        labelsStack.topAnchor.constraint(equalTo: collectionView.bottomAnchor,constant: 20).isActive = true
        labelsStack.bottomAnchor.constraint(equalTo: container.bottomAnchor,constant: -20).isActive = true
        labelsStack.leadingAnchor.constraint(equalTo:  container.leadingAnchor,constant: 20).isActive = true
        labelsStack.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        
        
    }

}


extension HomeController:UICollectionViewDelegate{
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let cellWidthIncludingSpacing = collectionView.frame.width - CGFloat(60) + 1
        
        var offset = targetContentOffset.pointee
        
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        
        
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        
        targetContentOffset.pointee = offset
        
        let dest = destinations[Int(roundedIndex)]
        townName.text = dest.townName
        shortDescription.text = dest.description
        print(roundedIndex)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        //Note: To avoid memory leaks I use a weak reference to self
        //That what 'weak self' means here
        labelsStack.transform = CGAffineTransform(translationX: 0, y: 20)

        UIView.animate(withDuration: 0.2) {[weak self ] in
            self?.labelsStack.alpha = 1
            self?.labelsStack.transform = .identity
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        labelsStack.alpha = 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? Cell{
            let dc = DetailsController()
            dc.transitioningDelegate = self
            dc.imageView.image = destinations[indexPath.item].image
            animator.initialFrame = view.convert(cell.destImageView.frame, from: cell)
            animator.finalFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.4)
            present(dc, animated: true, completion: nil)
        }
    }
}

extension HomeController:UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return destinations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? Cell{
            cell.destImageView.image = destinations[indexPath.item].image
            return cell
        }
        
        return UICollectionViewCell()
    }
}


extension HomeController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - CGFloat(60),
                      height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: xInset, bottom: 0, right: xInset)
    }
}

extension HomeController:UIViewControllerTransitioningDelegate{
 
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animator.isPresenting = true
        
        
        return animator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animator.isPresenting = false
        return animator
    }
}




















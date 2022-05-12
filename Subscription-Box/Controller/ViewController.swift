//
//  ViewController.swift
//  Subscription-Box
//
//  Created by Anneka Curry on 4/26/22.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var firstView: customView!
    var secondView: customView!
    var thirdView: customView!
    var pagesArray: [customView] = []
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    let container: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fillEqually
        return view
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        pageControl.pageIndicatorTintColor = UIColor(white: 1.0, alpha: 0.4)
        pageControl.currentPageIndicatorTintColor = UIColor.white
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
//MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setScrollView()
        setViews()
        setPageControl()

        // Do any additional setup after loading the view.
    }
//MARK: The Functions that load up
    func setScrollView(){
        scrollView.delegate = self
        //Hides nav bar
        self.navigationController?.isNavigationBarHidden = true
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(container)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            container.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            container.topAnchor.constraint(equalTo: scrollView.topAnchor),
            container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            container.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }
    
    func setViews(){
        firstView = customView(message:"Tell us about your pet's personality", imageName: "dog", isLastPage: false, color: #colorLiteral(red: 0.9392294288, green: 0.3101889491, blue: 0.02487670258, alpha: 1))
        secondView = customView(message: "Subscribe to your first box", imageName: "phone", isLastPage: false, color: #colorLiteral(red: 0.9556549191, green: 0.1256401241, blue: 0.3329801559, alpha: 1))
        thirdView = customView(message: "Get snacks and toys that your pet will love", imageName: "petFood", isLastPage: true, color: #colorLiteral(red: 0.3467746973, green: 0.2016363442, blue: 0.9727033973, alpha: 1))
        thirdView.continueButton.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
        pagesArray = [firstView,secondView,thirdView]
                
        for page in pagesArray{
            container.addArrangedSubview(page)
            page.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        }
    }
    
    func setPageControl(){
        pageControl.numberOfPages = pagesArray.count
        view.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
    
    @objc func continueTapped(){
        let nextVC = LoginVC()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

}


//
//  HomePageVC.swift
//  Subscription-Box
//
//  Created by Anneka Curry on 4/26/22.
//

import UIKit

class HomePageVC: UIViewController {
    
    var collectionView: UICollectionView!
    
    lazy var sections: [Section] = [
        TitleSection(title: "Featured Categories"),
        FeaturedSection(),
        TitleSection(title: "Last month's favorites"),
        ItemSection()
        
    ]
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        var section = self.sections
        let layout = UICollectionViewCompositionalLayout{
            (sectionIndex, environment) -> NSCollectionLayoutSection? in
            return self.sections[sectionIndex].layoutSection()
        }
        return layout
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        self.view.backgroundColor = UIColor.white
        setupCollectionView()
        
    }
    //MARK: Collection View Setup
    func setupCollectionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionViewLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.register(UINib(nibName: "TitleCell", bundle: .main), forCellWithReuseIdentifier: TitleCell.identifier)
        
        collectionView.register(UINib(nibName: "FeaturedCell", bundle: .main), forCellWithReuseIdentifier: FeaturedCell.identifier)
        
        collectionView.register(UINib(nibName: "ItemCell", bundle: .main), forCellWithReuseIdentifier: ItemCell.identifier)

        //--------------------------------
        self.view.addSubview(collectionView)
        collectionView.reloadData()
    }
    //MARK: View Did Appear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionView.reloadData()
    }
}

//MARK: Data Source
extension HomePageVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[indexPath.section].configureCell(collectionView: collectionView, indexPath: indexPath)
    }
}

extension HomePageVC: UICollectionViewDelegate {}

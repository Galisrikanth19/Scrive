//
//  CollectionViewVC.swift
//  Created by Srikanth on 03/04/22.

import UIKit

class CollectionViewVC: UIViewController {
    @IBOutlet weak var topBar: TopBar!
    
    @IBOutlet weak var collcView: UICollectionView!
    var dataArr:[CollcViewModel] = [CollcViewModel]() {
        didSet {
            self.collcView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    private func setupVC() {
        setupTopBar()
        setupCollcView()
        loadStaticData()
    }
    
    private func loadStaticData() {
        dataArr = CollcViewModelData.collcViewModelArr
    }
}

// MARK: Topbar
extension CollectionViewVC {
    private func setupTopBar() {
        topBar.updateTopBarTitle(WithLeftImage: "LeftArrow", WithTitleStr: "CollectionView")
        topBar.backBtnTapped = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
extension CollectionViewVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private func setupCollcView() {
        collcView.backgroundColor = .clear
        collcView.delegate = self
        collcView.dataSource = self
        collcView.setNoDataView(WithErrorImage: "NoData", WithErrorStr: "No Data Found!")
        
        collcView.showsHorizontalScrollIndicator = false
        collcView.showsVerticalScrollIndicator = false
        
        if let layout = collcView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataArr.count == 0 ? self.collcView.showNoDataView() : self.collcView.hideNoDataView()
        return dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collcCell = collectionView.dequeueReusableCell(withReuseIdentifier: CollcViewCell.className, for: indexPath) as! CollcViewCell
        collcCell.configureCollcCell()
        return collcCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.collcView.bounds.width)/3, height: (self.collcView.bounds.width)/3)
    }
}

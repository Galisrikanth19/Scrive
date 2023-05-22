//
//  HomeVC.swift
//  Created by Srikanth on 01/01/23

import UIKit

class HomeVC: BaseViewController {
    @IBOutlet weak var tbv: UITableView!
    var dataArr:[HomeModel] = [HomeModel]() {
        didSet{
            tbv.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    private func setupVC() {
        setupTbv()
        loadStaticData()
    }
    
    private func loadStaticData() {
        dataArr = HomeModelData.homeModelArr
    }
}

// MARK: UITableViewDataSource, UITableViewDelegate
extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    private func setupTbv() {
        tbv.dataSource = self
        tbv.delegate = self
        
        tbv.backgroundColor = .clear
        tbv.separatorColor = .clear
        
        tbv.showsVerticalScrollIndicator = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tbvCell = tableView.dequeueReusableCell(withIdentifier: HomeTbvCell.className, for: indexPath) as! HomeTbvCell
        tbvCell.configureCell(WithHomeModel: dataArr[indexPath.row])
        return tbvCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuItem = dataArr[indexPath.row].menu
        
        switch menuItem {
        case .tableview:
            TableviewVC.push(storyboard: .tableviewSB)
        case .collectionView:
            CollectionViewVC.push(storyboard: .collectionViewSB)
        case .textfeild:
            TextFieldVC.push(storyboard: .textfieldSB)
        case .checkbox:
            CheckBoxVC.push(storyboard: .checkBoxSB)
        case .enums:
            EnumVC.push(storyboard: .enumSB)
        default:
            self.showToast(WithMessage: "No object selected")
        }
    }
}

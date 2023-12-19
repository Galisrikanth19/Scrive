//
//  TableviewVC.swift
//  Created by Srikanth on 15/03/23.

import UIKit

class TableviewVC: BaseViewController {
    @IBOutlet weak var topBar: TopBar!
    
    @IBOutlet weak var tbv: UITableView!
    var dataArr:[TbvModel] = [TbvModel]() {
        didSet{
            tbv.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    private func setupVC() {
        setupTopBar()
        setupTbv()
        loadStaticData()
    }
    
    private func loadStaticData() {
        dataArr = []
        //dataArr = TbvListData.TbvModelArr
    }
}

// MARK: Topbar
extension TableviewVC {
    private func setupTopBar() {
        topBar.updateTopBarTitle(WithLeftImage: "LeftArrow", WithTitleStr: "Tableview")
        topBar.backBtnTapped = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: UITableViewDataSource, UITableViewDelegate
extension TableviewVC: UITableViewDataSource, UITableViewDelegate {
    private func setupTbv() {
        tbv.dataSource = self
        tbv.delegate = self
        
        tbv.backgroundColor = .clear
        tbv.separatorColor = .clear
        
        tbv.showsVerticalScrollIndicator = false
        tbv.keyboardDismissMode = .onDrag
        tbv.alwaysBounceVertical = false
        tbv.setNoDataView(WithImageName: "ErrorImage", WithTitleStr: "No data found")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArr.count == 0 ? self.tbv.showNoDataView() : self.tbv.hideNoDataView()
        //dataArr.count == 0 ? self.tbv.setEmptyMessage("No data found") : self.tbv.restore()
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tbvCell = tableView.dequeueReusableCell(withIdentifier: TbvCell.className, for: indexPath) as! TbvCell
        tbvCell.configureCell(WithTbvModel: dataArr[indexPath.row])
        return tbvCell
    }
}

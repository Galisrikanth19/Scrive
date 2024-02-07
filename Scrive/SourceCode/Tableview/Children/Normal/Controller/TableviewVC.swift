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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
    }
    
    deinit {
        tbv.removeObserver(self, forKeyPath: "contentSize")
    }
}

// MARK: CustomizeScreen
extension TableviewVC {
    private func setupVC() {
        setupTopBar()
        setupTbv()
    }
    
    private func loadData() {
        loadStaticData()
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
        tbv.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        tbv.setNoDataView(WithImageName: "ErrorImage", WithTitleStr: "No data found")
    }
    
    internal override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize" {
            if let obj = object as? UITableView, obj == self.tbv {
                if let newValue = change?[.newKey], let newSize = newValue as? CGSize {
                    print("Tableview height: \(newSize.height)")
                }
            }
        }
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

// MARK: LoadData
extension TableviewVC {
    private func loadStaticData() {
        dataArr = []
        //dataArr = TbvListData.TbvModelArr
    }
}

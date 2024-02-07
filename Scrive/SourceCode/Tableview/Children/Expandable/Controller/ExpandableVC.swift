//
//  ExpandableVC.swift
//  Created by Srikanth on 01/02/24.

import UIKit

class ExpandableVC: BaseViewController {
    @IBOutlet weak var topBar: TopBar!
    @IBOutlet weak var tbv: UITableView!
    var dataArr:[SectionModel] = [SectionModel]() {
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
}

// MARK: CustomizeScreen
extension ExpandableVC {
    private func setupVC() {
        setupTopBar()
        setupTbv()
    }
    
    private func loadData() {
        dataArr = ExpandableData.dataArr
    }
}

// MARK: Topbar
extension ExpandableVC {
    private func setupTopBar() {
        topBar.updateTopBarTitle(WithLeftImage: "LeftArrow", WithTitleStr: "Expandable")
        topBar.backBtnTapped = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: UITableViewDataSource, UITableViewDelegate
extension ExpandableVC: UITableViewDataSource, UITableViewDelegate {
    private func setupTbv() {
        tbv.dataSource = self
        tbv.delegate = self
        
        tbv.backgroundColor = .clear
        tbv.separatorColor = .clear
        
        tbv.showsVerticalScrollIndicator = false
        tbv.keyboardDismissMode = .onDrag
        tbv.alwaysBounceVertical = false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataArr[section].isOpened == true {
            return dataArr[section].rowsArr.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let tbvCell = tableView.dequeueReusableCell(withIdentifier: ExpandableHeaderTbvCell.className) as! ExpandableHeaderTbvCell
            tbvCell.configureCell(WithSectionModel: dataArr[indexPath.section])
            return tbvCell
        } else {
            let tbvCell = tableView.dequeueReusableCell(withIdentifier: ExpandableTbvCell.className) as! ExpandableTbvCell
            tbvCell.configureCell(WithRowModel: dataArr[indexPath.section].rowsArr[indexPath.row - 1])
            return tbvCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if dataArr[indexPath.section].isOpened == true {
                dataArr[indexPath.section].isOpened = false
                
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .middle)
            } else {
                dataArr[indexPath.section].isOpened = true
                
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .middle)
            }
        }
    }
}

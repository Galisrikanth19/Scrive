//
//  SubMenuVC.swift
//  Created by Srikanth on 01/02/24.

import UIKit

class SubMenuVC: BaseViewController {
    @IBOutlet weak var topBar: TopBar!
    @IBOutlet weak var tbv: UITableView!
    var dataArr:[SubMenuModel] = [SubMenuModel]() {
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

// MARK: ConfigureViewController
extension SubMenuVC {
    private func setupVC() {
        setupTopBar()
        setupTbv()
    }
    
    private func loadData() {
        dataArr = SubMenuData.subMenuModelArr
    }
}

// MARK: TopBar&BottomBar
extension SubMenuVC {
    private func setupTopBar() {
        topBar.updateTopBarTitle(WithLeftImage: "LeftArrow", WithTitleStr: "SubMenu")
        topBar.backBtnTapped = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: UITableViewDataSource, UITableViewDelegate
extension SubMenuVC: UITableViewDataSource, UITableViewDelegate {
    private func setupTbv() {
        tbv.dataSource = self
        tbv.delegate = self
        
        tbv.backgroundColor = .clear
        tbv.separatorColor = .clear
        
        tbv.showsVerticalScrollIndicator = false
        tbv.keyboardDismissMode = .onDrag
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tbvCell = tableView.dequeueReusableCell(withIdentifier: SubMenuTbvCell.className, for: indexPath) as! SubMenuTbvCell
        tbvCell.configureCell(WithSubMenuModel: dataArr[indexPath.row])
        return tbvCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuItem = dataArr[indexPath.row].subMenu
        
        switch menuItem {
            case .normal:
                TableviewVC.push(storyboard: .tableviewSB)
            case .expandable:
                ExpandableVC.push(storyboard: .expandableSB)
            default:
                self.showToast(WithMessage: "No object selected")
        }
    }
}

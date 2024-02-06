//
//  HomeVC.swift
//  Created by Srikanth on 01/01/23

import UIKit

class HomeVC: BaseViewController {
    @IBOutlet weak var bottomBar: BottomBar!
    
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
        updateHeaderAndBottomBar()
    }
    
    private func loadStaticData() {
        dataArr = HomeData.homeModelArr
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
        tbv.keyboardDismissMode = .onDrag
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
            SubMenuVC.push(storyboard: .subMenuSB)
        case .collectionView:
            CollectionViewVC.push(storyboard: .collectionViewSB)
        case .textfeild:
            TextFieldVC.push(storyboard: .textfieldSB)
        case .checkbox:
            CheckBoxVC.push(storyboard: .checkBoxSB)
        case .enums:
            EnumVC.push(storyboard: .enumSB)
        case .scrollView:
            ScrollViewVC.push(storyboard: .scrollViewSB)
        case .restApi:
            RestAPIVC.push(storyboard: .restAPISB)
        case .containerView:
            ParentVC.push(storyboard: .containerViewSB)
        case .calendarView:
            CalendarVC.push(storyboard: .calendarSB)
        default:
            self.showToast(WithMessage: "No object selected")
        }
    }
}

// MARK: Topbar & Bottombar
extension HomeVC {
    private func updateHeaderAndBottomBar() {
        let randomInt = Int.random(in: 1..<5)
        switch randomInt {
        case 1:
            bottomBar.selectBottomBarBtn(WithBottomBarItem: .home)
        case 2:
            bottomBar.selectBottomBarBtn(WithBottomBarItem: .appts)
        case 3:
            bottomBar.selectBottomBarBtn(WithBottomBarItem: .checkout)
        case 4:
            bottomBar.selectBottomBarBtn(WithBottomBarItem: .clients)
        default:
            print("")
        }
        
    }
}

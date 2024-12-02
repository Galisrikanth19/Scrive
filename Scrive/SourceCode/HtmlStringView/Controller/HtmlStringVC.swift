//
//  HtmlStringVC.swift
//  Created by GaliSrikanth on 19/04/24.

import UIKit

class HtmlStringVC: UIViewController {
    @IBOutlet weak var topBar: TopBar!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var despLbl: UILabel!
    
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
extension HtmlStringVC {
    private func setupVC() {
        setupTopBar()
    }
}

// MARK: Topbar
extension HtmlStringVC {
    private func setupTopBar() {
        topBar.updateTopBarTitle(WithLeftImage: "LeftArrow", WithTitleStr: "Html String")
        topBar.backBtnTapped = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.navigationController?.popViewController(animated: true)
        }
    }
}

extension HtmlStringVC {
    private func loadData() {
        if let myResponseM: MyResponseModel = AppUtility.readJSONFromFile(WithFileName: "LocalJson") {
            //Title
            let titleStr = myResponseM.data.message.paymentInfoKey
            if let titleAttributedString = titleStr.htmlAttributed() {
                titleLbl.attributedText = titleAttributedString
            } else {
                titleLbl.text = "Failed to load html string"
            }
            
            //Desp
            let despStr = myResponseM.data.message.paymentInfo
            if let despAttributedString = despStr.htmlAttributed() {
                despLbl.attributedText = despAttributedString
            } else {
                despLbl.text = "Failed to load html string"
            }
        }
    }
}

//
//  RandomJsonVC.swift
//  Created by GaliSrikanth on 19/04/24.

import UIKit

class RandomJsonVC: UIViewController {
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
extension RandomJsonVC {
    private func setupVC() {
        setupTopBar()
    }
    
    private func loadData() {
        let responseM: RandomResponseModel? = AppUtility.readJSONFromFile(WithFileName: "RandomData")
        dump(responseM)
        
        //Getting player1 score
        if let players = responseM?.data,
           players.isEmpty == false,
           let player = players.first {
            let score: Int = player.runs?.intValue ?? 0
            print("Player: \(player.name) scored: \(score)")
        }
    }
}

// MARK: Topbar
extension RandomJsonVC {
    private func setupTopBar() {
        topBar.updateTopBarTitle(WithLeftImage: "LeftArrow", WithTitleStr: "Randaom Json")
        topBar.backBtnTapped = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.navigationController?.popViewController(animated: true)
        }
    }
}

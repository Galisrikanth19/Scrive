//
//  BottomBar.swift
//  Created by Srikanth on 12/04/23.

import UIKit

enum BottomBarItems: String {
    case home = "Home"
    case appts = "Appts"
    case checkout = "CheckOut"
    case clients = "Clients"
}

class BottomBar: UIView {
    @IBOutlet weak var bottomViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var homeImgV: UIImageView!
    @IBOutlet weak var apptsImgV: UIImageView!
    @IBOutlet weak var checkoutImgV: UIImageView!
    @IBOutlet weak var clientsImgV: UIImageView!
    
    @IBOutlet weak var apptsLbl: UILabel!
    @IBOutlet weak var checkoutLbl: UILabel!
    @IBOutlet weak var clientsLbl: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        let contentView = loadViewFromNib()
        contentView.frame = bounds
        addSubview(contentView)
        
        let safeAreaBtm = (UIApplication.shared.windows.first{$0.isKeyWindow }?.safeAreaInsets.bottom ?? 0.0)
        bottomViewHeightConstraint.constant = ((safeAreaBtm > 0) ? safeAreaBtm/3 : 0) + 70
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: BottomBar.className, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view;
    }
    
    func selectBottomBarBtn(WithBottomBarItem bottomBarItem: BottomBarItems) {
        homeImgV.image = UIImage(named: "Home")
        apptsImgV.image = UIImage(named: "Appts")
        checkoutImgV.image = UIImage(named: "CheckOut")
        clientsImgV.image = UIImage(named: "Clients")
        apptsLbl.textColor = .titleColor
        checkoutLbl.textColor = .titleColor
        clientsLbl.textColor = .titleColor
        
        switch bottomBarItem {
            case .home:
                homeImgV.image = UIImage(named: "HomeSel")
            case .appts:
                apptsImgV.image = UIImage(named: "ApptsSel")
                apptsLbl.textColor = .titleColor
            case .checkout:
                checkoutImgV.image = UIImage(named: "CheckOutSel")
                checkoutLbl.textColor = .titleColor
            case .clients:
                clientsImgV.image = UIImage(named: "ClientsSel")
                clientsLbl.textColor = .titleColor
        }
    }
    
    @IBAction func didClickedOnBottomBarItem(_ sender: UIButton) {
        guard let btnTitle = sender.accessibilityIdentifier else { return }
        let selBtnType = BottomBarItems(rawValue: btnTitle)
        
        switch selBtnType {
            case .home:
                homeNavigation()
            case .appts:
                appointmentsNavigation()
            case .checkout:
                checkoutNavigation()
            case .clients:
                clientsNavigation()
            default:
                break
        }
    }
}

// MARK: BottomBar navigations
extension BottomBar {
    private func homeNavigation() {
        HomeVC.push(storyboard: .homeSB)
    }
    
    private func appointmentsNavigation() {
        HomeVC.push(storyboard: .homeSB)
    }
    
    private func checkoutNavigation() {
        HomeVC.push(storyboard: .homeSB)
    }
    
    private func clientsNavigation() {
        HomeVC.push(storyboard: .homeSB)
    }
}

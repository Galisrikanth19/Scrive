//
//  TopBar.swift
//  Created by Srikanth on 09/02/23.

import UIKit

class TopBar: UIView {
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var leftImgV: UIImageView!
    @IBOutlet weak var leftBtn: UIButton!
    
    @IBOutlet var rightImages: [UIImageView]!
    @IBOutlet var rightBtns: [UIButton]!
    @IBOutlet var rightViews: [UIView]!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bgViewHeightConst: NSLayoutConstraint!
    
    var backBtnTapped:(()->())?
    var rightBtnTapped:((Int)->())?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        addSubview(view)
        let safeAreaTop = (UIApplication.shared.windows.first{$0.isKeyWindow }?.safeAreaInsets.top ?? 0.0)
        bgViewHeightConst.constant = safeAreaTop + 40
    }
    
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: self.className, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        backBtnTapped?()
    }
    
    @IBAction func rightBtnClicked(_ sender: UIButton) {
        rightBtnTapped?(sender.tag)
    }
    
    func updateTopBarTitle(WithBackBtn backBtn: Bool = true,
                           WithLeftImage leftImg: String? = "",
                           WithTitleStr titleStr: String,
                           WithRightImage rightImg: [String?] = [],
                           WithRightTitle rightTitle: [String?] = []) {
        
        titleLbl.text = titleStr
        
        //---------------LeftBtn----------------------------
        leftView.isHidden = !backBtn
        
        if let _leftImg = leftImg, _leftImg.count > 0 {
            if let imgV = UIImage(named: _leftImg) {
                leftView.isHidden = false
                leftImgV.image = imgV
            }
        }
        for views in rightViews {
            views.isHidden = true
        }
        //----------------RightBtn---------------------------
        for(index, rImgName) in rightImg.enumerated() {
            if let imgV = UIImage(named: rImgName ?? "") {
                rightViews[index].isHidden = false
                rightImages[index].isHidden = false
                rightImages[index].image = imgV
            }
        }
        
        for(index, rTitle) in rightTitle.enumerated() {
            if rTitle?.count ?? 0 > 0 {
                rightViews[index].isHidden = false
                rightImages[index].isHidden = true
                rightBtns[index].setTitle(rTitle, for: .normal)
            }
        }
    }
}

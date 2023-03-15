//
//  NoDataView.swift
//  CollectionView
//
//  Created by Saanvi on 03/04/22.
//

import UIKit

class NoDataView: UIView {
    @IBOutlet weak var imgV: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
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
    }
    
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: NoDataView.className, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func updateViewWithData(WithImageName imgName: String, WithTitleStr _titleStr: String) {
        if imgName.count != 0, let _img = UIImage.init(named: imgName) {
            imgV.image = _img
        }
        titleLbl.text = _titleStr
    }
}

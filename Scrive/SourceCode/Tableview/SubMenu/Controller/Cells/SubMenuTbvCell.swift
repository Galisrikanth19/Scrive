//
//  SubMenuTbvCell.swift
//  Created by Srikanth on 15/03/23.

import UIKit

class SubMenuTbvCell: UITableViewCell {
    @IBOutlet weak var imgV: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(WithSubMenuModel subMenuM: SubMenuModel) {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        imgV.image = UIImage(named: (subMenuM.subMenu?.rawValue ?? "Placeholder"))
        titleLbl.text = (subMenuM.subMenu?.rawValue ?? "")
    }
}

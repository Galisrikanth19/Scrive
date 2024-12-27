//
//  HomeTbvCell.swift
//  Created by Srikanth on 15/03/23.

import UIKit

class HomeTbvCell: UITableViewCell {
    @IBOutlet weak var imgV: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(WithHomeModel homeM: HomeModel) {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        if let imgName = (homeM.menu?.rawValue),
           let img = UIImage(named: imgName) {
            imgV.image = img
        } else {
            imgV.image = UIImage(named: "Placeholder")
        }
        titleLbl.text = (homeM.menu?.rawValue ?? "")
    }
}

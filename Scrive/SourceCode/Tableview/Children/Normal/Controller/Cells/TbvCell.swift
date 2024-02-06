//
//  TbvCell.swift
//  Created by Srikanth on 15/03/23.

import UIKit

class TbvCell: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(WithTbvModel tbvM: TbvModel) {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        let emptySpace = "     "
        titleLbl.text = emptySpace + (tbvM.titleStr ?? "")
    }
}

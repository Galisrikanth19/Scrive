//
//  ExpandableTbvCell.swift
//  Created by Srikanth on 06/02/24.

import UIKit

class ExpandableTbvCell: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(WithRowModel rowM: RowModel) {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        titleLbl.text = rowM.title
    }
}

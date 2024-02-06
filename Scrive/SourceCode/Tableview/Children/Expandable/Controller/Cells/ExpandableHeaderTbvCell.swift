//
//  ExpandableHeaderTbvCell.swift
//  Created by Srikanth on 06/02/24.

import UIKit

class ExpandableHeaderTbvCell: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(WithSectionModel sectionM: SectionModel) {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        titleLbl.text = sectionM.title
    }
}

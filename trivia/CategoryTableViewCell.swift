//
//  CidadeTableViewCell.swift
//  trivia
//
//  Created by Cristiano Douglas on 02/09/22.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCell(title: String, description: String) {
        lblTitle.text = title
        lblDescription.text = description
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

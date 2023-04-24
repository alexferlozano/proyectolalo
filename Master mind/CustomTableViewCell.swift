//
//  CustomTableViewCell.swift
//  Master mind
//
//  Created by Solidusystems on 24/04/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var labelNombre: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

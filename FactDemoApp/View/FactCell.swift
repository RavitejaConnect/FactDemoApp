//
//  E_AnswerPreviewCell.swift
//  Semanoor
//
//  Created by Srinivas on 16/10/20.
//  Copyright © 2020 Nooor. All rights reserved.
//

import UIKit

class FactCell: UITableViewCell {

    @IBOutlet weak var cellContainer: UIView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageViewObj: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.cellContainer.layer.cornerRadius = 10
        self.cellContainer.layer.borderWidth = 0.5
        self.cellContainer.layer.borderColor = UIColor.lightGray.cgColor

        self.cellContainer.clipsToBounds = true;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

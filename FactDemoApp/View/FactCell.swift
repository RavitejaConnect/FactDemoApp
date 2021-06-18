//
//  E_AnswerPreviewCell.swift
//  Semanoor
//
//  Created by Srinivas on 16/10/20.
//  Copyright © 2020 Nooor. All rights reserved.
//

import UIKit

class FactCell: UITableViewCell {


    @IBOutlet weak var cellContainerView: UIView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageViewObj: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.cellContainerView.layer.cornerRadius = 10
        self.cellContainerView.layer.borderWidth = 0.5
        self.cellContainerView.layer.borderColor = UIColor.lightGray.cgColor
        self.cellContainerView.clipsToBounds = true;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

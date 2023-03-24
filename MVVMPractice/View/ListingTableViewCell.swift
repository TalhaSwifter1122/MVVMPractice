//
//  ListingTableViewCell.swift
//  RXPracticewithMVVM
//
//  Created by Dev ILI on 22/03/2023.
//

import UIKit

class ListingTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    var data : UsersData?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.mainView.layer.borderWidth = 0.5
        self.mainView.layer.borderColor = UIColor.blue.cgColor
        self.mainView.layer.cornerRadius = 12
    }
    
    func setData(){
        
        self.titleLabel.text  = data?.title
        self.detailLabel.text = data?.body
    }
}

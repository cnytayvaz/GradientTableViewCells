//
//  GradientTableViewCell.swift
//  gradient
//
//  Created by Cüneyt Ayvaz on 29.10.2020.
//

import UIKit

class GradientTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    var blackView: UIVisualEffectView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        label.text = "Cüneyt Ayvaz"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}


extension UITableViewCell {
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
}

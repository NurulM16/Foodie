//
//  InstructionTableViewCell.swift
//  Foodie
//
//  Created by Nurul Mustika on 12/12/24.
//

import UIKit

class InstructionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var lblStep: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}

extension InstructionTableViewCell: CellViewModelType {
    func configureCell(model: Step) {
        lblNumber.text = String(describing: model.number)
        lblStep.text = model.step
    }
    
}

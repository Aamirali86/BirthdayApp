//
//  BirthdayCell.swift
//  BirthdayApp
//
//  Created by Amir on 13/12/2020.
//

import UIKit

class BirthdayCell: UITableViewCell {
    
    //MARK:- IBOutlets
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var date: UILabel!
    
    //MARK:- Override
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func populate(with viewModel: BirthdayCellViewModelType) {
        name.text = viewModel.name
        date.text = viewModel.date
    }
    
}

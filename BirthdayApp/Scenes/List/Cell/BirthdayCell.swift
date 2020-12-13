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
    @IBOutlet private weak var profileImage: UIImageView!

    //MARK:- Override
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    //MARK:- Functions
    
    private func setupUI() {
        self.name.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        self.date.font = UIFont.systemFont(ofSize: 13, weight: .medium)
    }
    
    func populate(with viewModel: BirthdayCellViewModelType) {
        name.text = viewModel.name
        date.text = viewModel.date
    }
    
}

extension BirthdayCell: Instantiatable {}

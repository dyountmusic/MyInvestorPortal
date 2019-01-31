//
//  InvestmentTableViewCell.swift
//  MyInvestment
//
//  Created by Daniel Yount on 1/30/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import Foundation
import UIKit

class InvestmentTableViewCell: UITableViewCell {
    
    var investment: Investment?
    
    @IBOutlet weak var accountTitle: UILabel!
    @IBOutlet weak var amount: UILabel!
    
}

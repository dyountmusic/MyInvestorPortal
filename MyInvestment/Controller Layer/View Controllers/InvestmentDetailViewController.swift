//
//  InvestmentDetailViewController.swift
//  MyInvestment
//
//  Created by Daniel Yount on 1/30/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import UIKit

class InvestmentDetailViewController: UIViewController {

    var investment: Investment?
    
    @IBOutlet weak var amountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }
    
    func updateUI() {
        
        guard let investment = investment else { return }
        self.title = investment.name
        
        let roiString = String(describing: investment.returnOnInvestment) + "%"
        
        amountLabel.text = roiString
        
        if investment.returnOnInvestment > 0 {
            amountLabel.textColor = #colorLiteral(red: 0.1529411765, green: 0.6823529412, blue: 0.3764705882, alpha: 1)
        } else {
            amountLabel.textColor = #colorLiteral(red: 0.9058823529, green: 0.2980392157, blue: 0.2352941176, alpha: 1)
        }
        
        
    }
    
}

//
//  ViewController.swift
//  MyInvestment
//
//  Created by Daniel Yount on 1/30/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import UIKit

class InvestmentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let api = InvestmentInformationDownloadService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        updateUI()
        
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateUI()
    }
    
    func updateUI() {
        
        api.downloadInvestmentInformation { [unowned self] () -> (Void) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return api.investments.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "investmentCell") as? InvestmentTableViewCell else { return UITableViewCell() }
        
        let investment = api.investments[indexPath.row]
        
        cell.accountTitle.text = investment.name
        cell.amount.text = formatCurrencyAmount(amount: investment.amount)
        cell.investment = investment
        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? InvestmentDetailViewController {
            
            guard let index = tableView.indexPathForSelectedRow?.row else { return }
            destination.investment = api.investments[index]
            
        }
        
    }
    
    func formatCurrencyAmount(amount: Double) -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let amount = NSNumber(value: amount)
        guard let formattedAmountNumber = formatter.string(from: amount) else {
            return ""
        }
        return formattedAmountNumber
    }


}


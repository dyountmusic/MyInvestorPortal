//
//  InvestmentModel.swift
//  MyInvestment
//
//  Created by Daniel Yount on 1/30/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import Foundation

struct Investment: Codable {
    
    let name: String
    let amount: Double
    let returnOnInvestment: Double
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case amount = "amount"
        case returnOnInvestment = "ROI"
        case id = "id"
    }
    
}

//
//  InvestmentInformationDownloadService.swift
//  MyInvestment
//
//  Created by Daniel Yount on 1/30/19.
//  Copyright © 2019 Daniel Yount. All rights reserved.
//

import Foundation

class InvestmentInformationDownloadService {
    
    var investments = [Investment]()
    
    func downloadInvestmentInformation(completion: @escaping () -> (Void)) {
        
        let urlString = URLModel().url
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { [unowned self] (data, response, error) in
            if error != nil {
                return
            }
            
            let status = (response as! HTTPURLResponse).statusCode
            
            if status != 200 {
                return
            }
            
            guard let data = data else { return }
            
            do {
                let downloadedInvestments = try JSONDecoder().decode([Investment].self, from: data)
                
                self.investments = downloadedInvestments
                completion()
            } catch let jsonError {
                print("error serializing JSON from remote API. Info: \(jsonError.localizedDescription)")
            }
        }.resume()
        
    }
    
    
}

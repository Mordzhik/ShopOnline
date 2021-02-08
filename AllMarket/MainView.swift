//
//  MainView.swift
//  AllMarket
//
//  Created by tse on 10/12/20.
//  Copyright © 2020 marzhan. All rights reserved.
//

import UIKit

class MainView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource =  self 
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          var height: CGFloat = CGFloat()
          let row = indexPath.row
        
        if row == 0 {
            height = 130
             
        }
        else if row == 1 {
            height = 304
                      }
       else  if row == 2 {
             height = 1000
                       }
       else  if row == 3 {
             height = 304
                    }
       else  if row == 4{
             height = 304
                      }
        else {
            height = 304
            
        }
        
        
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        
        if row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FeautureCell") as! FeautureCell
            return cell
        } else if  row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier:  "HotSaleTableViewCell") as!  HotSaleTableViewCell
            return cell
        } else if row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as! CategoryTableViewCell
            return cell
        } else if row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GoodsSaleTableViewCell") as!
            GoodsSaleTableViewCell
            return cell
        } else  {
            let cell = tableView.dequeueReusableCell(withIdentifier:
               "RecomendTableViewCell") as! RecomendTableViewCell
            
            return cell
        }
         
    }
    



}

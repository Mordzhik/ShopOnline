//
//  CategoryTableViewController.swift
//  AllMarket
//
//  Created by tse on 10/5/20.
//  Copyright © 2020 marzhan. All rights reserved.
//

import UIKit
import Alamofire
import MHSoftUI


class CategoryTableViewController: UITableViewController {
    var sectionData: [Displayable] = []

    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        /*fetchURL(url: "http://allmarket.armenianbros.com/api/v2/product_sections")*/
        fetchCategory()
        
        
        
    }
    
 
   

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       return sectionData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath) as! SectionCell

        
        let item = sectionData[indexPath.row]
        cell.sectionTitle?.text = item.titleLabelText
        cell.sectionImg1?.image = UIImage(named: "imgL1")
        cell.sectionImg2?.image = UIImage(named: "img1")
        cell.backView.addSoftUIEffectForView()
       // cell.detailTextLabel?.text = item.subtitleLabelText


        return cell
    }
    
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // let source =  segue.source
      if  let destination = segue.destination as? SubcategoryTableViewController {
        if let cell = sender as? SectionCell {
            if let indexPath = tableView.indexPath(for: cell){
                let item = sectionData[indexPath.row]
                destination.item = item 
            }
        }
        }
    }

}

extension CategoryTableViewController {
 /* func fetchURL(url : String) {
   /* AF.request(url).responseDecodable(of: Section.self) { (response) in
        debugPrint("Response: \(response)")
        self.tableView.reloadData()
    }*/
    
             AF.request(url).responseJSON { (response) in
                  print (response.value ?? "no value")
                 self.tableView.reloadData()
              }.authenticate(username: "dev@allmarket.kz", password: "dev")
    
   
          }*/
  func fetchCategory() {
    
   AF.request("http://allmarket.armenianbros.com/api/v2/product_sections")
   .validate()
   .responseDecodable(of: Sections.self) { (response) in
     guard let sections = response.value else { return }
     self.sectionData = sections.allCategory
     self.tableView.reloadData()
    print (response.value ?? "no value")

   }.authenticate(username: "dev@allmarket.kz", password: "dev")
  }
}


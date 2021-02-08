//
//  SubcategoryTableViewController.swift
//  AllMarket
//
//  Created by tse on 10/6/20.
//  Copyright © 2020 marzhan. All rights reserved.
//

import UIKit

class SubcategoryTableViewController: UITableViewController {
    var item: Displayable?
    
    override func viewDidLoad() {
        super.viewDidLoad()

  }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    

}

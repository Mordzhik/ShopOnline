

import UIKit
import Alamofire

class SaleTableViewController: UITableViewController {
    
    var saleData: [SaleDisplayable] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchSale()
        tableView.reloadData()
        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104.0
    }

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return saleData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "saleCell", for: indexPath) as! SaleCell

        let saleItem = saleData[indexPath.row]
        //cell.textLabel?.text = saleItem.titleText
        
        cell.saleTitle?.text = saleItem.titleText
        cell.saleDescription?.text = saleItem.sdescription
        cell.saleStart?.text = saleItem.sstarted_at
        cell.saleFinish?.text = saleItem .sfinished_at
        cell.saleImg?.image = UIImage(named: "image_2")
        
        
        return cell
    }
    
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // let source =  segue.source
      if  let destination = segue.destination as? SubcategoryTableViewController {
        if let cell = sender as? SaleCell {
            if let indexPath = tableView.indexPath(for: cell){
                let items = saleData[indexPath.row]
                destination.item = items
            }
        }
        }
    }*/
    
}

extension SaleTableViewController {

  func fetchSale() {

   AF.request("http://allmarket.armenianbros.com/api/v2/sales?city_id=6")
   .validate()
   .responseDecodable(of: Sales.self) { (response) in
     guard let sales = response.value else { return }
    self.saleData = sales.allSales
    self.tableView.reloadData()
    print(sales.allSales[0].title)
    print (response.value ?? "no value")

   }.authenticate(username: "dev@allmarket.kz", password: "dev")
    
    
   /* let params = [
           "city_id": "6"
           ]
       
           
           let headers : HTTPHeaders  = [ "Accept": "application/json"]


       let requestofAPI =  AF.request("http://allmarket.armenianbros.com/api/v2/sales?city_id=6", method: .get, parameters: params, encoding: JSONEncoding.default, headers: headers)
    
        requestofAPI.responseJSON { (response) in
            print (response.value ?? "no value")
        }.responseString{ (response) in
            print (response.value ?? "no value")
                /*.validate()
        .responseDecodable(of: Sales.self) { (response) in
         guard let sales = response.value else { return }
         self.saleData = sales.all
         self.tableView.reloadData()*/

       }.authenticate(username: "dev@allmarket.kz", password: "dev")*/
  }
}



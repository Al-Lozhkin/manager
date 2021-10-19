//
//  TableViewController.swift
//  FinanceManager3
//
//  Created by Alexandr on 06.03.2020.
//  
import UIKit

class TableViewController: UIViewController, UITableViewDataSource {

    
    @IBOutlet weak var tableView1: UITableView!
    
    var incom1:Incom1!
      var order1:Order1!
    
    
    
      
      var coreData = (UIApplication.shared.delegate as! AppDelegate)
      
      
    
    
      override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView1.dataSource = self
        self.tableView1.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        
        
      }
      
      
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        do{
          return try coreData.persistentContainer.viewContext.fetch(Incom1.fetchRequest()).count
        } catch {
          print("coreData error: ", error)
          return 0
        }
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        
        do {
          
          let nameIncom1 = try coreData.persistentContainer.viewContext.fetch(Incom1.fetchRequest())[indexPath.item].name1
          let product1 = try coreData.persistentContainer.viewContext.fetch(Order1.fetchRequest())[indexPath.item].product1
          
            cell.textLabel?.text = "\(nameIncom1!): \(product1!)"
        } catch {
          print(error)
        }
        return cell
      }
    
    
    class CustomCell:UITableViewCell {
      override var reuseIdentifier: String? {
        return "CustomCell"
      }
    }
}

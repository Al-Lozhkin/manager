//
//  ViewController.swift
//  FinanceManager3
//
//  Created by Alexandr on 06.03.2020.
//  
import Foundation
import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    
  @IBOutlet weak var tableView: UITableView!
    
    var incom:Incom!
    var order:Order!
    
    var coreData = (UIApplication.shared.delegate as! AppDelegate)
    
    
    
    override func viewDidLoad() {
      super.viewDidLoad()
      
      self.tableView.dataSource = self
      self.tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
      
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      do{
        return try coreData.persistentContainer.viewContext.fetch(Incom.fetchRequest()).count
      } catch {
        print("coreData error: ", error)
        return 0
      }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
      
      do {
        
        let nameIncom = try coreData.persistentContainer.viewContext.fetch(Incom.fetchRequest())[indexPath.item].name
        let product = try coreData.persistentContainer.viewContext.fetch(Order.fetchRequest())[indexPath.item].product
        
        cell.textLabel?.text = "\(nameIncom!):\(product!)"
      } catch {
        print(error)
      }
      return cell
    }
  }

  class CustomCell:UITableViewCell {
    override var reuseIdentifier: String? {
      return "CustomCell"
    }
  }

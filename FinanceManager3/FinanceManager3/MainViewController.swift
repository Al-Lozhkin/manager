//
//  MainViewController.swift
//  FinanceManager3
//
//  Created by Alexandr on 10.03.2020.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    
    @IBOutlet weak var Summa: UILabel!
    @IBOutlet weak var Summa1: UILabel!
    @IBOutlet weak var Summa2: UILabel!
    var order:Order!
    var toDoItems: [Order] = []
    var order1:Order1!
    var toDoItems1: [Order1] = []
    
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequst: NSFetchRequest<Order> = Order.fetchRequest()
        let entity = NSEntityDescription.entity(forEntityName: "Order", in: context)
            do {
                toDoItems = try context.fetch(fetchRequst)

            } catch {
                print(error.localizedDescription)
            }

        //var m: Float = (Float(toDoItems.count))
        var i: Int = 0
        var k: Float = 0
        for _ in toDoItems
        {
            var mana = toDoItems[i].product!
            var m: Float = (Float(mana) as! Float)
            i = i + 1
            print(mana)
            k = k + (m)
        }
        Summa.text = "\(k)"
        let fetchRequst1: NSFetchRequest<Order1> = Order1.fetchRequest()
        let entity1 = NSEntityDescription.entity(forEntityName: "Order1", in: context)
            do {
                toDoItems1 = try context.fetch(fetchRequst1)

            } catch {
                print(error.localizedDescription)
            }

        //var m: Float = (Float(toDoItems.count))
        var i1: Int = 0
        var k1: Float = 0
        for _ in toDoItems1
        {
            var mana1 = toDoItems1[i1].product1!
            var m1: Float = (Float(mana1) as! Float)
            i1 = i1 + 1
            print(mana1)
            k1 = k1 + (m1)
        }
        Summa1.text = "\(k1)"
        var l = k - k1
        Summa2.text = "\(l)"
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        }
        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

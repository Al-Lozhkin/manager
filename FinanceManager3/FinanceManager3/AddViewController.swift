//
//  AddViewController.swift
//  FinanceManager3
//
//  Created by Alexandr on 09.03.2020.
//  Copyright © 2020 Alexandr Burtsev. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController {

    
    @IBOutlet weak var SegmentTool: UISegmentedControl!
    @IBOutlet weak var Egor: UILabel!
    @IBOutlet weak var sumIncom: UITextField!
        @IBOutlet weak var nameIncom: UITextField!
        //var toDoItems: [Incom] = []
    
        override func viewDidLoad() {
            super.viewDidLoad()
            Egor.text = ""
            // Do any additional setup after loading the view.
        }
        
        @IBAction func Add(_ sender: UIButton) {
            if SegmentTool.selectedSegmentIndex == 0 {
                
            
            if sumIncom.text != "" && nameIncom.text != ""
            {
            self.saveTaskName(name: (nameIncom?.text)!)
                self.saveTaskMoney(product: (sumIncom.text)!)
                sumIncom.text = ""
                nameIncom.text = ""
                Egor.text = ""
            }
            else {
                
                Egor.text = "Введите оба значения"
            }
            }
            
            else {
                if sumIncom.text != "" && nameIncom.text != ""
                {
                self.saveTaskName1(name1: (nameIncom?.text)!)
                    self.saveTaskMoney1(product1: (sumIncom.text)!)
                    sumIncom.text = ""
                    nameIncom.text = ""
                    Egor.text = ""
                }
                else {
                    Egor.text = "Введите оба значения"
                }
                
                
                
            }
        }
        func saveTaskName(name:String){
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Incom", in: context)
            let incomObject = NSManagedObject(entity: entity!, insertInto: context) as! Incom
            incomObject.name = name
            do {
                try context.save()
                //toDoItems.append(incomObject)
                print("Saved! Good Job")
            } catch {
                print(error.localizedDescription)

            }
        }
        func saveTaskMoney(product:String){
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Order", in: context)
            let incomObject1 = NSManagedObject(entity: entity!, insertInto: context) as! Order
            incomObject1.product = product
            do {
                try context.save()
                //toDoItems.append(incomObject)
                print("Saved! Good Job1")
            } catch {
                print(error.localizedDescription)
                
            }
        }
        func saveTaskName1(name1:String){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Incom1", in: context)
        let incomObject2 = NSManagedObject(entity: entity!, insertInto: context) as! Incom1
        incomObject2.name1 = name1
        do {
            try context.save()
            //toDoItems.append(incomObject)
            print("Saved! Good Job2")
        } catch {
            print(error.localizedDescription)

        }
    }
    func saveTaskMoney1(product1:String){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Order1", in: context)
        let incomObject3 = NSManagedObject(entity: entity!, insertInto: context) as! Order1
        incomObject3.product1 = product1
        do {
            try context.save()
            //toDoItems.append(incomObject)
            print("Saved! Good Job3")
        } catch {
            print(error.localizedDescription)
            
        }
    }
        
        /*
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        */

    }

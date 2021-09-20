//
//  CoreDataViewController.swift
//  BasicUIComponents
//
//  Created by Semih Emre ÜNLÜ on 19.09.2021.
//

import UIKit
import CoreData

class CoreDataViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private var entities: [MyCoreDataEntity] = []
    
    @IBAction func addButtonTapped(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistantContainer = appDelegate.persistentContainer
        let context = persistantContainer.viewContext
        
        let entity = MyCoreDataEntity(context: context)
        entity.title = "My Title"
        
        appDelegate.saveContext()
    }
    
    @IBAction func deleteFirstButtonTapped(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistantContainer = appDelegate.persistentContainer
        let context = persistantContainer.viewContext
        
        if let firstEntity = entities.first {
            context.delete(firstEntity)
        }
    }
    
    @IBAction func fetchAllButtonTapped(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistantContainer = appDelegate.persistentContainer
        let context = persistantContainer.viewContext
        
        let fetchRequest: NSFetchRequest<MyCoreDataEntity> = MyCoreDataEntity.fetchRequest()
        do {
            entities = try context.fetch(fetchRequest)
            print(entities)
            print(entities.first?.title)
        } catch {
            //handle error
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

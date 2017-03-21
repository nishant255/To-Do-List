//
//  ToDoViewController.swift
//  TodoList
//
//  Created by Nishant Patel on 3/20/17.
//  Copyright © 2017 Nishant Patel. All rights reserved.
//

import UIKit
import CoreData

class ToDoViewController: UITableViewController, AddItemDelegate {
    
    
    // DB Connection
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    // All Items
    var items = [ToDoListItem]()

    // Initializing Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()
    }
    
    // System Stuff
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Set Number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // Set Each Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! ToDoViewCell
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        cell.dateLabel.text = dateFormatter.string(from: items[indexPath.row].date as! Date)
        cell.descLabel.text = items[indexPath.row].desc
        cell.titleLabel.text = items[indexPath.row].title
        if items[indexPath.row].status == true {
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.none
        }
        return cell
    }
    
    
    // Add New Todo Button Pressed
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "addTodoItem", sender: sender)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        if item.status == true {
            item.status = false
        } else {
            item.status = true
        }
        
        do {
            try managedObjectContext.save()
        } catch {
            print("\(error)")
        }
        tableView.reloadData()
    }
    
    //Prepare Segue for Adding New Button
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender is UIBarButtonItem {
            let controller = segue.destination as! AddItemViewController
            controller.delegate = self
        }
    }
    
    // Adding New Item
    func itemSave(by controller: AddItemViewController, with todoTitle: String, with description: String, at date: Date){
        let item = NSEntityDescription.insertNewObject(forEntityName: "ToDoListItem", into: managedObjectContext) as! ToDoListItem
        item.title = todoTitle
        item.desc = description
        item.date = date as NSDate?
        item.status = false
        items.append(item)
        
        do {
            try managedObjectContext.save()
        } catch {
            print("\(error)")
        }
        
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    // Cancel Adding Item
    func cancelButtonPressed(by controller: AddItemViewController){
        dismiss(animated: true, completion: nil)
    }
    
    // Method for fetching all the data from DB.
    func fetchAllItems(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoListItem")
        do {
            let result = try managedObjectContext.fetch(request)
            items = result as! [ToDoListItem]
        } catch  {
            print("\(error)")
        }
        
    }

}

//
//  ViewController.swift
//  TodoList
//
//  Created by Nishant Patel on 3/20/17.
//  Copyright © 2017 Nishant Patel. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    weak var delegate: AddItemDelegate?
    @IBOutlet weak var toDoTitle: UITextField!
    @IBOutlet weak var desc: UITextField!
    @IBOutlet weak var todoDate: UIDatePicker!
    
    @IBAction func addItemButtonPressed(_ sender: UIButton) {
        let todoTitle = toDoTitle.text!
        let description = desc.text!
        let date = todoDate.date
        delegate?.itemSave(by: self, with: todoTitle, with: description, at: date)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        delegate?.cancelButtonPressed(by: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


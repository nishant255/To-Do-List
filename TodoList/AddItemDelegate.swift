//
//  File.swift
//  TodoList
//
//  Created by Nishant Patel on 3/20/17.
//  Copyright © 2017 Nishant Patel. All rights reserved.
//

import Foundation
protocol AddItemDelegate: class {
    func itemSave(by controller: AddItemViewController, with todoTitle: String, with description: String, at date: Date)
    
    func cancelButtonPressed(by controller: AddItemViewController)
}
